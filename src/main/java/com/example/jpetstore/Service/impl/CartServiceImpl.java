package com.example.jpetstore.Service.impl;

import com.example.jpetstore.Mapper.CartMapper;
import com.example.jpetstore.POJO.DataObject.CartDO;
import com.example.jpetstore.POJO.DataObject.PetItemDO;
import com.example.jpetstore.POJO.DataObject.PetProductDO;
import com.example.jpetstore.POJO.MapStruct.CartMapping;
import com.example.jpetstore.POJO.ViewObject.CartVO;
import com.example.jpetstore.Service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    @Autowired
    private CartMapping cartMapping;

    @Override
    public List<CartVO> selectCartList(int userId) {
        List<CartVO> cartVOList = new ArrayList<>();

        List<CartDO> cartDOS = cartMapper.selectCartList(userId);
        for (CartDO cartDO : cartDOS) {
            PetProductDO petProductDO = cartMapper.getProduct(cartDO.getProductId());
            PetItemDO petItemDO = cartMapper.getItem(cartDO.getItemId());
            CartVO cartVO = cartMapping.toCartVO(cartDO, petProductDO, petItemDO);
            cartVOList.add(cartVO);
        }

        return cartVOList;
    }

    /**
     * 无则插入，有则修改
     */
    @Override
    public void addCartItem(CartDO cartDO) {
        CartDO c = cartMapper.selectQuantity(cartDO);
        if (c == null) {
            cartMapper.addCartItem(cartDO);
        } else {
            c.setQuantity(cartDO.getQuantity() + c.getQuantity());
            cartMapper.updateItemQuantity(c);
        }
    }

    @Override
    public void updateItemQuantity(CartDO cartDO) {
        cartMapper.updateItemQuantity(cartDO);
    }

    @Override
    public void removeCartItem(int cartItemId) {
        cartMapper.removeCartItem(cartItemId);
    }
}
