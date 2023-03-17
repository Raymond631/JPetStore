package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:11
 * @description
 */
@Controller
@RequestMapping("/Cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @GetMapping("/MyCart.html")
    public String showMyCart(){
        return "/Cart/MyCart";
    }
}
