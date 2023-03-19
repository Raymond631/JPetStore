package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-03-17 20:57
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
    private int orderItemId;
    private Long orderId;
    private int itemId;
    private String itemImage;
    private String productNameChinese;
    private String itemSpecification;
    private BigDecimal itemPrice;
    private int itemQuantity;
    private String whetherShip;
}
