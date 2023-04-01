package com.example.jpetstore.Mapper;

import com.example.jpetstore.POJO.DataObject.CartDO;
import com.example.jpetstore.POJO.DataObject.PetItemDO;
import com.example.jpetstore.POJO.DataObject.PetProductDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:18
 * @description
 */
@Mapper
public interface CartMapper {
    List<CartDO> selectCartList(int userId);

    void addCartItem(CartDO cartDO);

    void updateItemQuantity(CartDO cartDO);

    void removeCartItem(int cartItemId);

    CartDO selectQuantity(CartDO cartDO);

    PetProductDO getProduct(int productId);

    PetItemDO getItem(int itemId);
}
