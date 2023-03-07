package com.zlp.jpetstore_spring.entity;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author Raymond Li
 * @create 2023-03-07 20:33
 * @description
 */

@Data
public class order_main {
    private String order_id;
    private String user_id;
    private String order_time;
    private BigDecimal order_cost;
    private String order_payment;
    private String receiver_name;
    private String receiver_phone;
    private String receiver_address;
}
