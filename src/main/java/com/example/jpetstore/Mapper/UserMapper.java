package com.example.jpetstore.Mapper;

import com.example.jpetstore.POJO.DataObject.UserAuthDO;
import com.example.jpetstore.POJO.DataObject.UserInfoDO;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Raymond Li
 * @create 2023-03-20 16:35
 * @description
 */
@Mapper
public interface UserMapper {
    /**
     * 根据account查找
     */
    public UserAuthDO selectUserByAccount(UserAuthDO userAuthDO);

    /**
     * 根据account和password查找
     */
    public UserAuthDO selectUserByAccountAndPwd(UserAuthDO userAuthDO);

    /**
     * 根据userId和password查找
     */
    public UserAuthDO selectUserByIdAndPwd(UserAuthDO userAuthDO);

    /**
     * 插入新用户
     */
    public int insertUser(UserAuthDO userAuthDO);

    /**
     * 修改密码
     */
    public int updatePassword(UserAuthDO userAuthDO);

    public UserInfoDO selectUserInfoById(int userId);

    public void insertUserInfo(UserInfoDO userInfoDO);

    public void insertUserAuth(UserAuthDO userAuthDO);

    public int updateNickname(String nickname, int userId);

    String selectUserAccountById(int userId);

    UserInfoDO getUserInfo(int userId);

    void updateReceiver(UserInfoDO userInfoDO);
}
