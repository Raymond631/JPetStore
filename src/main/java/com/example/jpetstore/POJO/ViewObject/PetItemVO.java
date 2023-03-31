package com.example.jpetstore.POJO.ViewObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-03-21 19:43
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetItemVO {
    private int itemId;
    private String itemSpecification;
    private BigDecimal itemPrice;
    private int itemStock;
}
