package com.example.jpetstore.Service;

import com.example.jpetstore.Common.CommonResponse;
import com.example.jpetstore.POJO.DataObject.UserAuthDO;
import com.example.jpetstore.POJO.DataObject.UserInfoDO;
import me.zhyd.oauth.request.AuthRequest;

import java.io.IOException;

/**
 * @author Raymond Li
 * @create 2023-03-20 16:32
 * @description
 */
public interface UserService {

    /**
     * 用户名查重
     * 注册，插入用户表
     */
    public UserInfoDO register(UserAuthDO userAuthDO);

    /**
     * 登陆，查用户名和密码是否匹配
     */
    public UserInfoDO login(UserAuthDO userAuthDO);

    /**
     * 原密码校验(以oldUserMainDO为实参，调用selectUserByIdAndPwd),如果返回值不为null，则进行下一步，否则返回错误信息（原密码错误）
     * 修改用户表的密码（以newUserMainDO为实参，调用updatePassword）
     */
    public CommonResponse changePassword(UserAuthDO oldUserAuthDO, UserAuthDO newUserAuthDO);

    public AuthRequest getAuthRequest(String source) throws IOException;

    public String getKey(String fileName) throws IOException;

    CommonResponse changeNickname(String nickname, int userId);

    UserInfoDO auth(UserAuthDO userAuthDO);

    String getAccount(int userId);

    UserInfoDO getUserInfo(int userId);

    void updateReceiver(UserInfoDO userInfoDO);
}
