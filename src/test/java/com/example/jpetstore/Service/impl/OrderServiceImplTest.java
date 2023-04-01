package com.example.jpetstore.Service.impl;

import com.example.jpetstore.POJO.DataObject.OrderItemDO;
import com.example.jpetstore.POJO.DataObject.OrderMainDO;
import com.example.jpetstore.Service.OrderService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-04-01 22:08
 * @description
 */
@SpringBootTest
@RunWith(SpringRunner.class)
class OrderServiceImplTest {

    @Autowired
    private OrderService orderService;

    @Test
    void newOrder() {
        List<OrderMainDO> list = new ArrayList<>();
        List<OrderItemDO> items = new ArrayList<>();
        OrderItemDO orderItemDO = new OrderItemDO(1, 1, 1, 1, "1.jpg", "金毛", "雄性", new BigDecimal("10.58"), 557);
        items.add(orderItemDO);
        OrderMainDO orderMainDO = new OrderMainDO(1, 17, "2023-04-01 19:07:51", new BigDecimal("45.87"), "微信支付", "张三", "158", "中南", 1, 1, items);
        list.add(orderMainDO);
        orderService.newOrder(list);
    }
}