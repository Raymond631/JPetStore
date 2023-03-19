package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.entity.Order;
import com.zlp.jpetstore_spring.entity.User;
import com.zlp.jpetstore_spring.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    // 请求页面
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


    // AJAX请求数据
    @GetMapping("/list")
    @ResponseBody
    public Object getOrderList(HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        return orderService.getOrderList(user.getUserId());
    }

    @GetMapping("/details")
    @ResponseBody
    public Object getOrderDetails(@RequestParam("orderId") String orderId) {
        return orderService.getOrderDetails(Long.valueOf(orderId));
    }

    @PutMapping("/confirmReceipt")
    @ResponseBody
    public void confirmReceipt(@Param("orderItemId") int orderItemId) {
        orderService.confirmReceipt(orderItemId);
    }

    @GetMapping("/getAddress")
    @ResponseBody
    public Object getAddress(HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        return orderService.getAddress(user.getUserId());
    }

    @PostMapping("/newOrder")
    @ResponseBody
    public void newOrder(@RequestBody Order order, HttpSession session) {
        System.out.println("后端接收" + order);
        User user = (User) session.getAttribute("loginUser");
        orderService.newOrder(user.getUserId(), order);
    }


    // @GetMapping("/OrderManage.html")
    // public String showOrderManage(HttpSession session, ModelMap modelMap){
    //     User user = (User) session.getAttribute("loginUser");
    //
    //     return "/Backstage/production/OrderManage";
    // }
}
