package com.zlp.jpetstore_spring.service;

import com.zlp.jpetstore_spring.entity.Cart;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:13
 * @description
 */
public interface CartService {
    public int addCartItem(Cart cart);//增

    public List<Cart> selectCartList(String userId);//查

    public int removeCartItem(int itemID);//删

    public int updateItemQuantity(int itemID,int quantity);//改

}
