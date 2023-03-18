package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-18 11:20
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Receiver {
    private int receiverId;
    private String userId;
    private String receiverName;
    private String receiverPhone;
    private String receiverAddress;
}
