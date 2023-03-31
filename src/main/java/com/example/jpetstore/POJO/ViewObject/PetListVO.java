package com.example.jpetstore.POJO.ViewObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-21 19:33
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetListVO {
    private int productId;
    private String category;
    private String productNameChinese;
    private String productNameEnglish;
    private String productImage;
}
