package com.zlp.jpetstore_spring.entity;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

/**
 * @author Raymond Li
 * @create 2023-03-17 18:01
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @NotBlank(message = "用户名不能为空")
    @Length(max = 8,message = "用户名不能超过8位")
    private String userId;

    @NotBlank(message = "密码不能为空")
    @Length(max = 16,message = "密码不能超过16位")
    private String password;

    @NotBlank(message = "验证码不能为空")
    private String vCode;
}
