package com.example.jpetstore.POJO.ViewObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-03-21 10:56
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderVO {
    private int orderId;
    private String orderTime;
    private BigDecimal orderCost;
    private String receiverName;
    private String receiverPhone;
    private String receiverAddress;
    private int status;
    private String items;
}
