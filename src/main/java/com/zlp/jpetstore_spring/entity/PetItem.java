package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-03-18 9:49
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetItem {
    private int itemId;
    private int productId;
    private String itemSpecification;
    private BigDecimal itemPrice;
    private int itemStock;
}
