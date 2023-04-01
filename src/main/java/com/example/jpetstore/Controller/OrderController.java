package com.example.jpetstore.Controller;

import com.alibaba.fastjson.JSON;
import com.example.jpetstore.Common.CommonResponse;
import com.example.jpetstore.Common.JwtUtil;
import com.example.jpetstore.POJO.DataObject.OrderMainDO;
import com.example.jpetstore.POJO.ViewObject.OrderVO;
import com.example.jpetstore.Service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:11
 * @description
 */
@RestController
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping("/orders")
    public CommonResponse getOrderList(@CookieValue("token") String token) {
        int userId = (int) JwtUtil.resolveToken(token).get("userId");
        return CommonResponse.success(orderService.getOrderList(userId));
    }

    @GetMapping("/orders/{orderId}")
    public CommonResponse getOrderDetails(@PathVariable("orderId") int orderId) {
        return CommonResponse.success(orderService.getOrderDetails(orderId));
    }

    @PutMapping("/orders/{orderId}")
    public CommonResponse confirmReceipt(@PathVariable("orderId") int orderId) {
        orderService.confirmReceipt(orderId);
        return CommonResponse.success("收货成功");
    }

    @PostMapping("/order")
    public CommonResponse newOrder(@RequestBody OrderVO orderVO, @CookieValue("token") String token) {
        int userId = (int) JwtUtil.resolveToken(token).get("userId");
        List<OrderMainDO> orderMainDOList = orderService.splitOrder(orderVO, userId);

        System.out.println(JSON.toJSONString(orderMainDOList));
        orderService.newOrder(orderMainDOList);
        return CommonResponse.success("订单创建成功");
    }
}
