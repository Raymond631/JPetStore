package com.zlp.jpetstore_spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-18 9:45
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetProduct {
    private int productId;
    private String category;
    private String productNameChinese;
    private String productNameEnglish;
    private String productCharacter;
    private String productAncestry;
    private String productDisease;
    private String productLife;
    private String productIntroduce;
    private String productImage;
    private String productSupplier;
    private List<PetItem> petItemList;
}
