package com.zlp.jpetstore_spring.service.impl;

import com.zlp.jpetstore_spring.entity.*;
import com.zlp.jpetstore_spring.mapper.OrderMapper;
import com.zlp.jpetstore_spring.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:16
 * @description
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> getOrderList(String userId) {
        return orderMapper.getOrderList(userId);
    }

    @Override
    public Order getOrderDetails(Long orderId) {
        return orderMapper.getOrderDetails(orderId);
    }

    @Override
    public void confirmReceipt(int orderItemId) {
        orderMapper.updateWhetherShip(orderItemId, "已接收");
    }

    @Override
    public List<Receiver> getAddress(String userId) {
        return orderMapper.selectReceiver(userId);
    }

    @Override
    public void newOrder(String userId, Order order) {
        // 判断库存
        List<Integer> stockList = new ArrayList<>();
        List<Integer> quantityList = new ArrayList<>();
        for (OrderItem orderItem : order.getOrderItemList()) {
            quantityList.add(orderItem.getItemQuantity());
            int stock = orderMapper.selectStock(orderItem.getItemId());
            stockList.add(stock);
        }
        // 如果库存足够,创建订单
        if (stockEnough(stockList, quantityList)) {
            order.setUserId(userId);
            orderMapper.insertOrderMain(order);

            List<OrderItem> orderItemList = order.getOrderItemList();
            for (int i = 0, len = orderItemList.size(); i < len; i++) {
                orderItemList.get(i).setOrderId(order.getOrderId());
                orderMapper.insertOrderItem(orderItemList.get(i));

                // 修改库存
                orderMapper.updateStock(orderItemList.get(i).getItemId(), stockList.get(i) - quantityList.get(i));

                // 从购物车移除
                orderMapper.deleteFromCart(userId, orderItemList.get(i).getItemId());
            }
        }
    }

    @Override
    public List<OrderManage> getOrderManageData(String userId) {
        List<OrderManage> orderManageList = new ArrayList<>();
        List<OrderManageTemp> orderManageTempList = orderMapper.selectOrderItemBySupplier(userId);
        for (OrderManageTemp temp : orderManageTempList) {
            OrderManage orderManage = new OrderManage();
            orderManage.setId(temp.getOrderItemId());
            orderManage.setName(temp.getOrder().getReceiverName());
            orderManage.setPhone(temp.getOrder().getReceiverPhone());
            orderManage.setPosition(temp.getOrder().getReceiverAddress());
            orderManage.setDate(temp.getOrder().getOrderTime());
            orderManage.setStatus(temp.getWhetherShip());
            orderManage.setAmount(temp.getItemQuantity());
            orderManage.setCategory(temp.getProductNameChinese() + ":" + temp.getItemSpecification());
            orderManageList.add(orderManage);
        }
        return orderManageList;
    }

    @Override
    public void ship(int orderItemId) {
        orderMapper.updateWhetherShip(orderItemId, "已发货");
    }

    public boolean stockEnough(List<Integer> stockList, List<Integer> quantityList) {
        int len = stockList.size();
        for (int i = 0; i < len; i++) {
            if (stockList.get(i) < quantityList.get(i)) {
                return false;
            }
        }
        return true;
    }
}
