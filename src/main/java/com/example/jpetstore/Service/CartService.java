package com.example.jpetstore.Service;


import com.example.jpetstore.POJO.DataObject.CartDO;
import com.example.jpetstore.POJO.ViewObject.CartVO;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:13
 * @description
 */
public interface CartService {
    List<CartVO> selectCartList(int userId);

    void addCartItem(CartDO cartDO);

    void updateItemQuantity(CartDO cartDO);

    void removeCartItem(int cartItemId);
}
