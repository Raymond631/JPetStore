package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-19 19:35
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderManage {
    private int id;// orderItemId
    private String name;// receiverName
    private String phone;// receiverPhone
    private String position;// receiverAddress
    private String date;// orderTime
    private String status;// whetherShip
    private int amount;// itemQuantity
    private String category;// productNameChinese+itemSpecification
}
