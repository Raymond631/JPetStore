package com.example.jpetstore.POJO.ViewObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-30 23:13
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReceiverVO {
    private String receiverName;
    private String receiverPhone;
    private String receiverAddress;
}
