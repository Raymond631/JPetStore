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
     * @param cart
     * @return
     */
    @Override
    public void addCartItem(Cart cart) {
        Integer num=cartMapper.selectQuantity(cart.getItemId());
        if(num==null){
            cartMapper.addCartItem(cart);
        }else{
            updateItemQuantity(cart.getItemId(),num+cart.getQuantity());
        }
    }

    @Override
    public List<Cart> selectCartList(String userId) {
        return cartMapper.selectCartList(userId);
    }

    @Override
    public int removeCartItem(int itemId) {
        return cartMapper.removeCartItem(itemId);
    }

    @Override
    public int updateItemQuantity(int itemId, int quantity) {
        return cartMapper.updateItemQuantity(itemId,quantity);
    }
}
