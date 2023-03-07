package com.zlp.jpetstore_spring.entity;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-03-07 20:25
 * @description
 */

@Data
public class pet_item {
    private int item_id;
    private int product_id;
    private String item_specification;
    private BigDecimal item_price;
    private int item_stock;
}
