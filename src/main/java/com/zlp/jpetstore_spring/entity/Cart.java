package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-18 11:18
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private int cartItemId;
    private String userId;
    private int itemId;
    private int quantity;
}
