package com.zlp.jpetstore_spring.service.impl;

import com.zlp.jpetstore_spring.entity.Order;
import com.zlp.jpetstore_spring.mapper.OrderMapper;
import com.zlp.jpetstore_spring.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:16
 * @description
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> getOrderList(String username) {
        return orderMapper.getOrderList(username);
    }

    @Override
    public Order getOrderDetails(Long orderId) {
        return orderMapper.getOrderDetails(orderId);
    }
}
