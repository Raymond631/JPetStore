package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:09
 * @description
 */
@Controller
@RequestMapping("/User")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/Login.html")
    public String showLogin(){
        return "User/Login";
    }

    @GetMapping("/Register.html")
    public String showRegister(){
        return "User/Register";
    }

    @GetMapping("/SelfCenter.html")
    public String showSelfCenter(){
        return "User/SelfCenter";
    }
}
