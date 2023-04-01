package com.example.jpetstore.POJO.ViewObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-04-01 18:11
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderVO {
    private String receiverName;
    private String receiverPhone;
    private String receiverAddress;
    private List<CartVO> cartList;
    private String orderPayment;
}
