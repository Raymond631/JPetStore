package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-08 8:52
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    private int code;
    private String msg;
}
