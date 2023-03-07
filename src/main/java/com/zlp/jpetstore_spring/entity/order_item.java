package com.zlp.jpetstore_spring.entity;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-03-07 20:36
 * @description
 */

@Data
public class order_item {
    private int order_item_id;
    private String order_id;
    private int item_id;
    private int item_quantity;
    private BigDecimal item_cost;
}