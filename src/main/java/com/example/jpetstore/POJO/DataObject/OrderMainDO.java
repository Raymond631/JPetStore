package com.example.jpetstore.POJO.DataObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-20 22:58
 * @description 对应数据库的order_main表，通过MapStruct插件转换封装后，传给前端
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderMainDO {
    private int orderId;
    private int userId;
    private String orderTime;
    private BigDecimal orderCost;
    private String orderPayment;
    private String receiverName;
    private String receiverPhone;
    private String receiverAddress;
    private int supplierId;
    private int status;

    private List<OrderItemDO> orderItemDOList;
}
