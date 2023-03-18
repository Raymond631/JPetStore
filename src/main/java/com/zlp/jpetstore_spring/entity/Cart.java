package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-18 11:18
 * @description
 */

//注解了全参构造和无参构造
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private int cartItemId;
    private String userId;
    private int productId;
    private int itemId;
    private int quantity;

    //下面的属性是为了方便进行级联查询
    private PetProduct petProduct;
    private PetItem petItem;
}
