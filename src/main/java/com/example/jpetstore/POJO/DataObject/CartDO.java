package com.example.jpetstore.POJO.DataObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-20 22:51
 * @description 对应数据库的cart表，通过MapStruct插件转换封装后，传给前端
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDO {
    private int cartItemId;
    private String userId;
    private int productId;
    private int itemId;
    private int quantity;
}
