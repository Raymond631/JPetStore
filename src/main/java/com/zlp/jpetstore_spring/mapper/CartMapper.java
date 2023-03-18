package com.zlp.jpetstore_spring.mapper;

import com.zlp.jpetstore_spring.entity.Cart;
import com.zlp.jpetstore_spring.entity.PetItem;
import com.zlp.jpetstore_spring.entity.PetProduct;
import org.apache.ibatis.annotations.Mapper;

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
     * 有一样的则数量叠加
     * @param itemId
     * @return
     */
    Integer selectQuantity(int itemId);

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
     * @param cartItemId
     * @param quantity
     * @return
     */
    int updateItemQuantity (int cartItemId,int quantity);


    /**
     * 用于级联查询
     * @param productId
     * @return
     */
    PetProduct selectProductInfo(int productId);

    /**
     * 用于级联查询
     * @param itemId
     * @return
     */
    PetItem selectItemInfo(int itemId);
}
