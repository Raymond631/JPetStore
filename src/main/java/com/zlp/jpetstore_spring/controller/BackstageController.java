package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.entity.User;
import com.zlp.jpetstore_spring.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @author Raymond Li
 * @create 2023-03-19 19:25
 * @description
 */
@Controller
@RequestMapping("/Backstage")
public class BackstageController {
    @Autowired
    private OrderService orderService;

    @GetMapping("/OrderManage.html")
    public String showOrderManage() {
        return "/Backstage/production/OrderManage";
    }

    @GetMapping("/getOrderManageData")
    @ResponseBody
    public Object getOrderManageData(HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        return orderService.getOrderManageData(user.getUserId());
    }

    @PutMapping("/ship")
    @ResponseBody
    public void ship(@RequestParam("id") int orderItemId) {
        orderService.ship(orderItemId);
    }
}
