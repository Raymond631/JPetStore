package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.entity.Cart;
import com.zlp.jpetstore_spring.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:11
 * @description
 */
@Controller
@RequestMapping("/Cart")
@Validated
public class CartController {
    @Autowired
    private CartService cartService;

    @GetMapping("/MyCart.html")
    public String showMyCart(){
        return "/Cart/MyCart";
    }


    @PostMapping(value = "/addCartItem")
    public String addCartItem(
            @ModelAttribute Cart cart)
    {
        cartService.addCartItem(cart);
        return "/Cart/MyCart";
    }

    @GetMapping(value = "/selectCartList")
    public String selectCartList(
            @RequestParam("userId")String userId
    ){
        List<Cart> cartList = cartService.selectCartList(userId);
        return "/Cart/MyCart";
    }
    @GetMapping(value = "/removeCartItem")
    public String removeCartItem(
            @RequestParam("itemId") int itemId
    ){
        cartService.removeCartItem(itemId);
        return "/Cart/MyCart";
    }
    // public int updateItemQuantity(int itemID,int quantity);//改
    @GetMapping(value = "/updateItemQuantity")
    public String updateItemQuantity(
            @RequestParam("itemId") int itemId,
            @RequestParam("quantity") int quantity
    ){
        cartService.updateItemQuantity(itemId,quantity);
        return "/Cart/MyCart";
    }
}
