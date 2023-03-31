package com.example.jpetstore.POJO.ViewObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-21 19:41
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetDetailVO {
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

    private List<PetItemVO> petItemList;
}
