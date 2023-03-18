package com.zlp.jpetstore_spring;

import com.zlp.jpetstore_spring.entity.Cart;
import com.zlp.jpetstore_spring.service.CartService;
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
    private CartService cartService;

    @Test
    public void abc() {
        Cart cart=new Cart();
        cart.setUserId("csu001");
        cart.setProductId(1);
        cart.setItemId(2);
        cart.setQuantity(10);
        cartService.addCartItem(cart);
    }
}