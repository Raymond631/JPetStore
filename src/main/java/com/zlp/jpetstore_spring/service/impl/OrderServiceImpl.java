package com.zlp.jpetstore_spring.service.impl;

import com.zlp.jpetstore_spring.mapper.CartMapper;
import com.zlp.jpetstore_spring.mapper.OrderMapper;
import com.zlp.jpetstore_spring.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:16
 * @description
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
}
