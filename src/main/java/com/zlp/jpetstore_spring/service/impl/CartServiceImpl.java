package com.zlp.jpetstore_spring.service.impl;

import com.zlp.jpetstore_spring.entity.Cart;
import com.zlp.jpetstore_spring.mapper.CartMapper;
import com.zlp.jpetstore_spring.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:16
 * @description
 */
@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartMapper cartMapper;

    /**
     * 有则合并，无则插入

     *
     * @param userId

     * @param cart
     * @return
     */
    @Override

    public void addCartItem(String userId, Cart cart) {
        Integer num = cartMapper.selectQuantity(userId, cart.getItemId());
        if (num == null) {
            cart.setUserId(userId);
            cartMapper.addCartItem(cart);
        } else {
            cartMapper.updateQuantityWhenAdd(cart.getUserId(), cart.getItemId(), num + cart.getQuantity());

        }
    }

    @Override
    public List<Cart> selectCartList(String userId) {
        return cartMapper.selectCartList(userId);
    }

    @Override

    public int removeCartItem(int cartItemId) {
        return cartMapper.removeCartItem(cartItemId);
    }

    @Override
    public int updateItemQuantity(int cartItemId, int quantity) {
        return cartMapper.updateItemQuantity(cartItemId, quantity);

    }
}
