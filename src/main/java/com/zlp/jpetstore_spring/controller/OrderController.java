package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:11
 * @description
 */
@Controller
@RequestMapping("/Order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping("/MyOrder.html")
    public String showMyOrder(){
        return "/Order/MyOrder";
    }

    @GetMapping("/OrderDetails.html")
    public String showOrderDetails(){
        return "/Order/OrderDetails";
    }

    @GetMapping("/OrderSubmit.html")
    public String showOrderSubmit(){
        return "/Order/OrderSubmit";
    }
}
