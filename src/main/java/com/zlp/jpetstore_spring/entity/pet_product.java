package com.zlp.jpetstore_spring.entity;

import lombok.Data;

/**
 * @author Raymond Li
 * @create 2023-03-07 20:24
 * @description
 */
@Data
public class pet_product {
    private int product_id;
    private String category;
    private String product_name_Chinese;
    private String product_name_English;
    private String product_character;
    private String product_ancestry;
    private String product_disease;
    private String product_life;
    private String product_introduce;
    private String product_image;
}
