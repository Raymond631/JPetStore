package com.example.jpetstore.Service;

import com.example.jpetstore.POJO.DataObject.OrderMainDO;
import com.example.jpetstore.POJO.ViewObject.OrderVO;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-04-01 14:33
 * @description
 */
public interface OrderService {
    boolean newOrder(List<OrderMainDO> orderMainDOList);

    List<OrderMainDO> splitOrder(OrderVO orderVO, int userId);

    List<OrderMainDO> getOrderList(int userId);

    OrderMainDO getOrderDetails(int orderId);

    void confirmReceipt(int orderId);
}
