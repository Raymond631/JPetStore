package com.zlp.jpetstore_spring;

import com.zlp.jpetstore_spring.mapper.OrderMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author Raymond Li
 * @create 2023-03-15 22:02
 * @description
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class commonTest {
    @Autowired
    private OrderMapper orderMapper;

    @Test
    public void abc() {
        System.out.println(orderMapper.getOrderDetails(1L));
    }
}
