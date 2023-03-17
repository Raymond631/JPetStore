package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.entity.Message;
import com.zlp.jpetstore_spring.entity.User;
import com.zlp.jpetstore_spring.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:09
 * @description
 */
@Controller
@RequestMapping("/User")
@Slf4j
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

    @PostMapping("/login")
    public String login(@Validated User user, HttpSession session, ModelMap modelMap){
        String checkCode= (String) session.getAttribute("checkCode");
        if(!checkCode.equals(user.getVCode())){
            modelMap.addAttribute(new Message(0,"验证码错误"));
            return "User/Login";
        }
        else {
            if(!userService.loign(user)){
                modelMap.addAttribute(new Message(0,"用户名或密码错误"));
                return "User/Login";
            }
            else {
                log.info(user.getUsername()+"成功登录");
                session.setAttribute("loginUser",user);
                return "Pet/Index";
            }
        }
    }
}
