package com.example.jpetstore.POJO.DataObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-03-20 22:59
 * @description 对应数据库的order_item表，通过MapStruct插件转换封装后，传给前端
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItemDO {
    private int orderItemId;
    private int orderId;
    private int itemId;
    private int productId;
    private String itemImage;
    private String productNameChinese;
    private String itemSpecification;
    private BigDecimal itemPrice;
    private int itemQuantity;
}
