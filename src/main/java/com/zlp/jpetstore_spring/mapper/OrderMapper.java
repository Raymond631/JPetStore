package com.zlp.jpetstore_spring.mapper;

import com.zlp.jpetstore_spring.entity.Order;
import com.zlp.jpetstore_spring.entity.OrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:18
 * @description
 */
@Mapper
public interface OrderMapper {
    List<Order> getOrderList(@Param("username") String username);

    Order getOrderDetails(@Param("orderId") Long orderId);

    List<OrderItem> selectOrderItemById(@Param("order_id") Long orderId);
}
