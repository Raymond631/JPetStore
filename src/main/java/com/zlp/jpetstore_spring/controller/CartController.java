package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.entity.Cart;
import com.zlp.jpetstore_spring.entity.Message;
import com.zlp.jpetstore_spring.entity.User;
import com.zlp.jpetstore_spring.service.CartService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/selectCartList")
    @ResponseBody
    public Object selectCartList(HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        return cartService.selectCartList(user.getUserId());
    }

    @PostMapping("/addCartItem")
    @ResponseBody
    public Object addCartItem(@RequestBody Cart cart) {
        cartService.addCartItem(cart);
        return new Message(1,"加入购物车成功");
    }

    @DeleteMapping("/removeCartItem")
    @ResponseBody
    public Object removeCartItem(@RequestParam("itemId") int itemId) {
        cartService.removeCartItem(itemId);
        return new Message(1,"购物车宠物移除成功");
    }

    @PutMapping("/updateItemQuantity")
    @ResponseBody
    public Object updateItemQuantity(@RequestBody Cart cart){
        cartService.updateItemQuantity(cart.getItemId(),cart.getQuantity());
        return new Message(1,"购物车宠物数量修改成功");
    }
}
