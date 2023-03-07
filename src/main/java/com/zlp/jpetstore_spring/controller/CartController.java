package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:11
 * @description
 */
@RestController
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;
}
