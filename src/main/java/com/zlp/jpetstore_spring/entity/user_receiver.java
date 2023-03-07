package com.zlp.jpetstore_spring.entity;

import lombok.Data;

/**
 * @author Raymond Li
 * @create 2023-03-07 20:23
 * @description
 */
@Data
public class user_receiver {
    private int receiver_id;
    private String user_id;
    private String receiver_name;
    private String receiver_phone;
    private String receiver_address;
}
