package com.zlp.jpetstore_spring;

import com.zlp.jpetstore_spring.controller.CartController;
import com.zlp.jpetstore_spring.entity.Cart;
import com.zlp.jpetstore_spring.mapper.CartMapper;
import com.zlp.jpetstore_spring.mapper.OrderMapper;
import com.zlp.jpetstore_spring.service.impl.CartServiceImpl;
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
    private CartMapper cartMapper;

    @Autowired
    private CartController cartController;




    @Test
    public void abc() {

    }
}
