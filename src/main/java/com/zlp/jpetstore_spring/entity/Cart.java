package com.zlp.jpetstore_spring.entity;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

/**
 * @author Raymond Li
 * @create 2023-03-18 11:18
 * @description
 */

//注解了全参构造和无参构造
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
//    代理主键，无意义
    @NotBlank
    private int cartItemId;
    @NotBlank(message = "用户名不能为空")
    @Length(max = 8,message = "用户名不能超过8位")
    private String userId;
    @NotBlank(message = "宠物ID不能为空")
    private int itemId;
    @NotBlank(message = "数量不能为空")
    private int quantity;

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
