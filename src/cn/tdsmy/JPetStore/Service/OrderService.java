package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.Receiver;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 8:38
 * @Version 1.0
 */
public interface OrderService
{
    public Receiver getReceiver(String username);//查询默认收件人信息

    public void addOrder(String username, Order order);//提交订单

    public void clearCart(String username);//订单提交后，清空购物车

    public void deleteOrder(String orderID);//删除订单

    public List<Order> selectOrderList(String username);//查询订单列表

    public Order selectOrder(String orderID);//查询订单详情

    public String getTimeNow();

    public String createOrderID();
}
