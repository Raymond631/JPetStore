package com.example.jpetstore.POJO.DataObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-20 22:54
 * @description 对应数据库的pet_product表，通过MapStruct插件转换封装后，传给前端
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetProductDO {
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
    private int supplierId;

    private List<PetItemDO> petItemList;
}
