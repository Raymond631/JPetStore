package com.zlp.jpetstore_spring.mapper;

import com.zlp.jpetstore_spring.entity.Cart;
import org.apache.ibatis.annotations.Mapper;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:18
 * @description
 */
@Mapper
public interface CartMapper {

    /**
     * 加入购物车
     * @param cart
     * @return
     */
    int addCartItem (Cart cart);

    /**
     * 根据userId查询用户购物车所有信息
     * @param userId
     * @return
     */
    List<Cart> selectCartList(String userId);

    /**
     * 根据itemID删除
     * @param itemID
     * @return
     */
    int removeCartItem(int itemID);

    /**
     * 根据itemId修改商品数量quantity
     * @param itemID,quantity
     * @return
     */
    int updateItemQuantity (int itemID,int quantity);




}
