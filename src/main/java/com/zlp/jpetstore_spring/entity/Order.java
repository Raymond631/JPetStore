package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-17 20:54
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Long orderId;
    private String userId;
    private String orderTime;
    private BigDecimal orderCost;
    private String orderPayment;
    private String receiverName;
    private String receiverPhone;
    private String receiverAddress;
    private List<OrderItem> orderItemList;
}
