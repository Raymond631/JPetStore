package com.zlp.jpetstore_spring.service.impl;

import com.zlp.jpetstore_spring.entity.Cart;
import com.zlp.jpetstore_spring.mapper.CartMapper;
import com.zlp.jpetstore_spring.service.CartService;
import org.junit.Test;
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


    @Override
    public int addCartItem(Cart cart) {
        return cartMapper.addCartItem(cart);
    }

    @Override
    public List<Cart> selectCartList(String userId) {
        return cartMapper.selectCartList(userId);
    }

    @Override
    public int removeCartItem(int itemID) {
        return cartMapper.removeCartItem(itemID);
    }

    @Override
    public int updateItemQuantity(int itemID, int quantity) {
        return cartMapper.updateItemQuantity(itemID,quantity);

    }
}
