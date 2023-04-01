package com.example.jpetstore.Mapper;

import com.example.jpetstore.POJO.DataObject.OrderItemDO;
import com.example.jpetstore.POJO.DataObject.OrderMainDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-04-01 14:34
 * @description
 */
@Mapper
public interface OrderMapper {
    void insertOrderMain(OrderMainDO orderMainDO);

    void insertOrderItem(OrderItemDO orderItemDO);

    List<OrderMainDO> getOrderList(int userId);

    OrderMainDO getOrderDetails(int orderId);

    void confirmReceipt(int orderId);

    int updateStock(int itemId, int itemQuantity);

    int removeFromCart(int userId, int itemId);
}
