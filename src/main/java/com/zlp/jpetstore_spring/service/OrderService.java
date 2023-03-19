package com.zlp.jpetstore_spring.service;

import com.zlp.jpetstore_spring.entity.Order;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:13
 * @description
 */
public interface OrderService {
    List<Order> getOrderList(String userId);

    Order getOrderDetails(Long orderId);

    void confirmReceipt(int orderItemId);

    Object getAddress(String userId);

    void newOrder(String userId, Order order);
}
