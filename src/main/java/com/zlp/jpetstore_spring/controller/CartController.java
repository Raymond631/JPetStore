package com.zlp.jpetstore_spring.controller;

import com.alibaba.fastjson.JSONArray;
import com.zlp.jpetstore_spring.entity.Cart;
import com.zlp.jpetstore_spring.entity.Order;
import com.zlp.jpetstore_spring.entity.User;
import com.zlp.jpetstore_spring.service.CartService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

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

    @GetMapping(value = "/selectCartList")
    public String selectCartList(HttpSession session, ModelMap modelMap){
        User user = (User) session.getAttribute("user");
        List<Cart> cartList = cartService.selectCartList(user.getUserId());
        modelMap.addAttribute("cartList", cartList);
        return "/Cart/MyCart";
    }
    @GetMapping(value = "/removeCartItem")
    public String removeCartItem(@RequestParam("itemID") int itemId){
        cartService.removeCartItem(itemId);
        return "/Cart/MyCart";
    }

    @PostMapping(value = "/updateItemQuantity")
    public String updateItemQuantity(HttpServletRequest req){
        String jsonObj = req.getParameter("jsonObj");
        JSONArray jsonArr = JSONArray.parseArray(jsonObj);
        for (int i = 0; i < jsonArr.size(); i++) {
            JSONObject obj = jsonArr.getJSONObject(i);
            int itemId = (int) obj.get("itemID");
            int quantity = (int) obj.get("quantity");
            cartService.updateItemQuantity(itemId,quantity);
        }
        return "/Cart/MyCart";
    }
    @PostMapping(value = "/addCartItem")
    public String addCartItem(HttpSession session,HttpServletRequest req)
    {
        User user = (User) session.getAttribute("user");
        int itemId = Integer.parseInt(req.getParameter("itemID"));
        Cart cart = new Cart();
        String userId= (String) session.getAttribute("userId");
        int quantity= (int) session.getAttribute("quantity");
        int cartItemId= (int) session.getAttribute("cartItemId");
        cart.setUserId(user.getUserId());
        cart.setItemId(itemId);
        cart.setQuantity(quantity);
        cart.setCartItemId(cartItemId);
        cartService.addCartItem(cart);
        return "/Cart/MyCart";
    }



}
