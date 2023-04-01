package com.example.jpetstore.Mapper;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author Raymond Li
 * @create 2023-04-01 21:54
 * @description
 */
@SpringBootTest
@RunWith(SpringRunner.class)
class OrderMapperTest {

    @Autowired
    private OrderMapper orderMapper;

    @Test
    void updateStock() {
        orderMapper.removeFromCart(17, 2);
    }
}