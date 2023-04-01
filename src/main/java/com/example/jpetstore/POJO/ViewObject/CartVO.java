package com.example.jpetstore.POJO.ViewObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-04-01 16:58
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {
    private int cartItemId;
    private int productId;
    private int itemId;
    private int quantity;


    private String productNameChinese;
    private String productImage;
    private int supplierId;


    private String itemSpecification;
    private BigDecimal itemPrice;
    private int itemStock;
}
