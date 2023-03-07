package com.zlp.jpetstore_spring.entity;

import lombok.Data;

/**
 * @author Raymond Li
 * @create 2023-03-07 20:32
 * @description
 */

@Data
public class cart {
    private int cart_item_id;
    private String user_id;
    private int item_id;
    private int quantity;
}
