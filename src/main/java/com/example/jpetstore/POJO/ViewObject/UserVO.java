package com.example.jpetstore.POJO.ViewObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-21 0:15
 * @description 登录用第1、3、5、6个属性，注册用1、3、4、5、6，修改密码用2、3、4、5、6
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
    private String username;
    private String oldPassword;
    private String password;
    private String rePassword;
    private String id;// 验证码（键）
    private String code;// 验证码（值）
}
