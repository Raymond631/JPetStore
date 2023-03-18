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
        Cart cart = new Cart();
        cart.setCartItemId(4);
        cart.setUserId("a");
        cart.setItemId(1);
        cart.setQuantity(2);
//        Cart cart1 = new Cart();
//        cart1.setCartItemId(3);
//        cart1.setUserId("a");
//        cart1.setItemId(3);
//        cart1.setQuantity(1);

//        System.out.println(cartMapper.addCartItem(cart1));
//        System.out.println(cartMapper.selectCartList(cart.getUserId()));
//        System.out.println(cartMapper.updateItemQuantity(cart.getCartItemId(),10));
 //       System.out.println(cartMapper.removeCartItem(cart1.getItemId()));

        //cartController.addCartItem(cart);
        // cartController.selectCartList(cart.getUserId());
        //cartController.updateItemQuantity(cart.getItemId(),66);
        cartController.removeCartItem(cart.getItemId());
    }
}
