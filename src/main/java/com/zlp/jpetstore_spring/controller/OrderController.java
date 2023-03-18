package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.entity.Order;
import com.zlp.jpetstore_spring.entity.User;
import com.zlp.jpetstore_spring.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
    public String showMyOrder() {
        return "/Order/MyOrder";
    }

    @GetMapping("/OrderDetails.html")
    public String showOrderDetails() {
        return "/Order/OrderDetails";
    }

    @GetMapping("/OrderSubmit.html")
    public String showOrderSubmit() {
        return "/Order/OrderSubmit";
    }

    @GetMapping("/list")
    public String getOrderList(HttpSession session, ModelMap modelMap) {
        User user = (User) session.getAttribute("loginUser");
        List<Order> orderList = orderService.getOrderList(user.getUserId());
        modelMap.addAttribute("orderList", orderList);
        return "/Order/MyOrder";
    }

    @GetMapping("/details")
    public String getOrderDetails(@RequestParam("orderId") Long orderId,ModelMap modelMap) {
        Order order = orderService.getOrderDetails(orderId);
        modelMap.addAttribute("order", order);
        return "/Order/OrderDetails";
    }

}
