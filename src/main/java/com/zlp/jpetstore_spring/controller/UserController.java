package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.service.CartService;
import com.zlp.jpetstore_spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:09
 * @description
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
}
