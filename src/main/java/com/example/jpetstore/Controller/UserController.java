package com.example.jpetstore.Controller;

import com.example.jpetstore.Common.CommonResponse;
import com.example.jpetstore.Common.JwtUtil;
import com.example.jpetstore.POJO.DataObject.UserAuthDO;
import com.example.jpetstore.POJO.DataObject.UserInfoDO;
import com.example.jpetstore.POJO.MapStruct.UserMapping;
import com.example.jpetstore.POJO.ViewObject.UserVO;
import com.example.jpetstore.Service.UserService;
import com.wf.captcha.SpecCaptcha;
import com.wf.captcha.base.Captcha;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.util.DigestUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.awt.*;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author Raymond Li
 * @create 2023-04-01 0:02
 * @description
 * TODO 第三方登录
 * TODO Redis
 * TODO 文件服务器
 * TODO 下单事务操作
 */
@Slf4j
@RestController
public class UserController {
    /**
     * 业务层接口
     */
    @Autowired
    private UserService userService;

    /**
     * 对象转换器
     */
    @Autowired
    private UserMapping userMapping;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    /**
     * 生成验证码
     * 前端从cookie中获取键
     */
    @GetMapping("/verificationCode")
    public void createCode(HttpServletResponse response) throws IOException {
        // 生成键
        String id = UUID.randomUUID().toString();
        Cookie cookie = new Cookie("CaptchaCode", id);
        response.addCookie(cookie);

        // 设置大小，以及位数
        SpecCaptcha specCaptcha = new SpecCaptcha(129, 48, 4);
        // 设置字体
        specCaptcha.setFont(new Font("Times New Roman", Font.ITALIC, 34));
        // 设置类型
        specCaptcha.setCharType(Captcha.TYPE_NUM_AND_UPPER);
        // 输出流
        specCaptcha.out(response.getOutputStream());

        // 存入redis
        String code = specCaptcha.text().toLowerCase();
        stringRedisTemplate.opsForValue().set(id, code);
        stringRedisTemplate.expire(id, 10, TimeUnit.MINUTES);
    }

    /**
     * 检查验证码
     */
    public boolean checkCode(String id, String code) {
        String s = stringRedisTemplate.opsForValue().get(id);
        stringRedisTemplate.delete(id);
        return code.equalsIgnoreCase(s);
    }

    /**
     * 登录接口
     * 退出登录由前端直接删除token即可
     */
    @PostMapping("/token")
    public CommonResponse login(@RequestBody UserVO userVO, HttpServletResponse resp, @CookieValue String CaptchaCode) {
        userVO.setId(CaptchaCode);
        if (checkCode(userVO.getId(), userVO.getCode())) {
            // 对象转换
            UserAuthDO userAuthDO = userMapping.toUserAuthDO(userVO);
            // MD5加密
            userAuthDO.setPassword(DigestUtils.md5DigestAsHex(userAuthDO.getPassword().getBytes()));
            // 配置登录方式（密码登录）
            userAuthDO.setLoginType(1);
            // 登录
            UserInfoDO userInfo = userService.login(userAuthDO);
            if (userInfo != null) {
                // 生成令牌
                String token = JwtUtil.generateToken(JwtUtil.userInfoDOtoMap(userInfo));
                Cookie cookie = new Cookie("token", token);
                resp.addCookie(cookie);

                return CommonResponse.success("登录成功");
            } else {
                throw new RuntimeException("用户名或密码错误");
            }
        } else {
            throw new RuntimeException("验证码错误");
        }
    }

    /**
     * 注册
     */
    @PostMapping("/user")
    public CommonResponse register(@RequestBody @Validated UserVO userVO, HttpServletResponse resp, @CookieValue String CaptchaCode) {
        userVO.setId(CaptchaCode);
        if (checkCode(userVO.getId(), userVO.getCode())) {
            if (userVO.getPassword().equals(userVO.getRePassword())) {
                // 对象转换
                UserAuthDO userAuthDO = userMapping.toUserAuthDO(userVO);
                // MD5加密
                userAuthDO.setPassword(DigestUtils.md5DigestAsHex(userAuthDO.getPassword().getBytes()));
                // 配置登录方式（密码登录）
                userAuthDO.setLoginType(1);
                // 注册
                UserInfoDO userInfo = userService.register(userAuthDO);
                if (userInfo != null) {
                    // 生成令牌
                    String token = JwtUtil.generateToken(JwtUtil.userInfoDOtoMap(userInfo));
                    Cookie cookie = new Cookie("token", token);
                    resp.addCookie(cookie);
                    return CommonResponse.success("注册成功");
                } else {
                    throw new RuntimeException("该账号已存在,请换一个id注册");
                }
            } else {
                throw new RuntimeException("两次输入的密码不一致");
            }
        } else {
            throw new RuntimeException("验证码错误");
        }
    }

    @GetMapping("/user/info")
    public CommonResponse getUserInfo(@CookieValue("token") String token) {
        int userId = (int) JwtUtil.resolveToken(token).get("userId");
        return CommonResponse.success(userService.getUserInfo(userId));
    }

    @PutMapping("/user/info")
    public CommonResponse updateReceiver(@RequestBody UserInfoDO userInfoDO, @CookieValue("token") String token) {
        int userId = (int) JwtUtil.resolveToken(token).get("userId");
        userInfoDO.setUserId(userId);
        userService.updateReceiver(userInfoDO);
        return CommonResponse.success("修改成功");
    }

    @PutMapping("/user/auth")
    public CommonResponse changePassword(@RequestBody UserVO userVO, @CookieValue("token") String token, @CookieValue String CaptchaCode) {
        userVO.setId(CaptchaCode);
        int userId = (int) JwtUtil.resolveToken(token).get("userId");
        if (checkCode(userVO.getId(), userVO.getCode())) {
            if (userVO.getPassword().equals(userVO.getRePassword())) {
                // 旧密码
                UserAuthDO oldUserAuthDO = new UserAuthDO(userId, 1, "", DigestUtils.md5DigestAsHex(userVO.getOldPassword().getBytes()));
                // 新密码
                UserAuthDO newUserAuthDO = new UserAuthDO(userId, 1, "", DigestUtils.md5DigestAsHex(userVO.getPassword().getBytes()));
                // 修改密码,返回提示信息
                return userService.changePassword(oldUserAuthDO, newUserAuthDO);
            } else {
                throw new RuntimeException("两次输入的密码不一致");
            }
        } else {
            throw new RuntimeException("验证码错误");
        }
    }
}