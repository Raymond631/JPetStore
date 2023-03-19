package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-19 20:03
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderManageTemp {
    private int orderItemId;
    private String whetherShip;
    private int itemQuantity;
    private String productNameChinese;
    private String itemSpecification;

    private Order order;
}
