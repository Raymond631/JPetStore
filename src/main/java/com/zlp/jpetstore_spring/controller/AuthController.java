package com.zlp.jpetstore_spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Raymond Li
 * @create 2023-03-15 23:29
 * @description
 */
@Controller
public class AuthController {
    @GetMapping("/")
    public String showIndex(){
        return "redirect:/Pet/Index.html";
    }

    @GetMapping("/Error/NotLogin.html")
    public String showNotLogin(){
        return "/Error/NotLogin";
    }
}
