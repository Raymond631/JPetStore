package com.zlp.jpetstore_spring;


import com.zlp.jpetstore_spring.service.OrderService;

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

    private OrderService orderService;

    @Test
    public void abc() {
        // List<OrderItem> orderItemList = new ArrayList<>();
        // OrderItem orderItem = new OrderItem(89, 5L, 1, 1, "/jpetstore/pet/1.jpg", "金毛", "雄性", new BigDecimal(10.54), 6, "已发货", "csu001");
        // OrderItem orderItem2 = new OrderItem(90, 5L, 6, 2, "/jpetstore/pet/6.jpg", "哈士奇", "雄性", new BigDecimal(28.00), 3, "未发货", "csu001");
        // orderItemList.add(orderItem);
        // orderItemList.add(orderItem2);
        // Order order = new Order(4L, "JFA", "2023-03-17 21:14:59", new BigDecimal(38.54), "微信", "pr", "158", "铁道", orderItemList);
        // orderService.newOrder("123", order);

        System.out.println(orderService.getOrderManageData("csu001"));

    }
}