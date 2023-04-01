package com.example.jpetstore.Service.impl;

import com.example.jpetstore.Common.CommonResponse;
import com.example.jpetstore.Mapper.UserMapper;
import com.example.jpetstore.POJO.DataObject.UserAuthDO;
import com.example.jpetstore.POJO.DataObject.UserInfoDO;
import com.example.jpetstore.Service.UserService;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.exception.AuthException;
import me.zhyd.oauth.request.AuthAlipayRequest;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.request.AuthWeiboRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.nio.charset.StandardCharsets;

/**
 * @author Raymond Li
 * @create 2023-03-20 16:33
 * @description
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public UserInfoDO register(UserAuthDO userAuthDO) {
        UserAuthDO user = userMapper.selectUserByAccount(userAuthDO);
        if (user != null) {
            // 用户账号已存在
            return null;
        } else {
            UserInfoDO userInfoDO = new UserInfoDO(0, userAuthDO.getAccount(), "", "", "");
            userMapper.insertUserInfo(userInfoDO);

            // 插入返回的自增主键
            userAuthDO.setUserId(userInfoDO.getUserId());
            userAuthDO.setLoginType(1);// 密码登录
            userMapper.insertUserAuth(userAuthDO);

            return userInfoDO;
        }
    }

    /**
     * 如果登录成功，查询user_info表，返回userInfo对象
     */
    @Override
    public UserInfoDO login(UserAuthDO userAuthDO) {
        UserAuthDO user = userMapper.selectUserByAccountAndPwd(userAuthDO);
        if (user != null) {
            return userMapper.selectUserInfoById(user.getUserId());
        } else {
            return null;
        }
    }

    @Override
    public CommonResponse changePassword(UserAuthDO oldUserAuthDO, UserAuthDO newUserAuthDO) {
        UserAuthDO userAuthDO = userMapper.selectUserByIdAndPwd(oldUserAuthDO);
        if (userAuthDO == null) {
            return CommonResponse.error("原密码错误");
        } else {
            int num = userMapper.updatePassword(newUserAuthDO);
            if (num == 1) {
                return CommonResponse.success("修改密码成功");
            } else {
                return CommonResponse.error("修改密码失败");
            }
        }

    }


    /**
     * 创建请求
     */
    @Override
    public AuthRequest getAuthRequest(String source) throws IOException {
        AuthRequest authRequest;
        switch (source.toLowerCase()) {
            case "alipay":
                authRequest = new AuthAlipayRequest(AuthConfig.builder()
                        .clientId("2021003184678755")
                        .clientSecret(getKey("应用私钥RSA2048-敏感数据，请妥善保管.txt"))
                        .alipayPublicKey(getKey("alipayPublicKey_RSA2.txt"))
                        .redirectUri("http://192.168.3.107:8888/jpetstore/callback/alipay")
                        .build());
                break;
            case "weibo":
                authRequest = new AuthWeiboRequest(AuthConfig.builder()
                        .clientId("3582380050")
                        .clientSecret("cdbafc2c9282bea42de2799089416e5b")
                        .redirectUri("http://192.168.3.107:8888/jpetstore/callback/weibo")
                        .build());
                break;
            default:
                throw new AuthException("未获取到有效的Auth配置");
        }
        return authRequest;
    }

    /**
     * 读取支付宝私钥
     */
    @Override
    public String getKey(String fileName) throws IOException {
        StringBuilder key = new StringBuilder();
        try (Reader reader = new FileReader(System.getProperty("user.home") + "/Documents/支付宝开放平台密钥工具/密钥20230323104847/" + fileName, StandardCharsets.UTF_8)) {
            while (true) {
                // 反复调用read()方法，直到返回-1
                int n = reader.read();
                if (n == -1) {
                    break;
                } else {
                    key.append((char) n);
                }
            }
        }
        return key.toString();
    }

    @Override
    public CommonResponse changeNickname(String nickname, int userId) {
        int num = userMapper.updateNickname(nickname, userId);
        if (num == 1) {
            return CommonResponse.success("修改昵称成功");
        } else {
            return CommonResponse.error("修改昵称失败");
        }
    }

    @Override
    public UserInfoDO auth(UserAuthDO userAuthDO) {
        UserAuthDO user = userMapper.selectUserByAccount(userAuthDO);
        if (user != null) {
            // 登录
            return userMapper.selectUserInfoById(user.getUserId());
        } else {
            // 注册
            UserInfoDO userInfoDO = new UserInfoDO(0, userAuthDO.getAccount(), "", "", "");
            userMapper.insertUserInfo(userInfoDO);

            // 插入返回的自增主键
            userAuthDO.setUserId(userInfoDO.getUserId());
            userMapper.insertUserAuth(userAuthDO);

            return userInfoDO;
        }
    }

    @Override
    public String getAccount(int userId) {
        return userMapper.selectUserAccountById(userId);
    }

    @Override
    public UserInfoDO getUserInfo(int userId) {
        return userMapper.getUserInfo(userId);
    }

    @Override
    public void updateReceiver(UserInfoDO userInfoDO) {
        userMapper.updateReceiver(userInfoDO);
    }

}
