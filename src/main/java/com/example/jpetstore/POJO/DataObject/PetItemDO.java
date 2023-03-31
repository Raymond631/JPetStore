package com.example.jpetstore.POJO.DataObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-03-20 22:56
 * @description 对应数据库的pet_item表，通过MapStruct插件转换封装后，传给前端
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetItemDO {
    private int itemId;
    private int productId;
    private String itemSpecification;
    private BigDecimal itemPrice;
    private int itemStock;
}
