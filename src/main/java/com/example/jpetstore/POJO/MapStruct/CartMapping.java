package com.example.jpetstore.POJO.MapStruct;

import com.example.jpetstore.POJO.DataObject.CartDO;
import com.example.jpetstore.POJO.DataObject.PetItemDO;
import com.example.jpetstore.POJO.DataObject.PetProductDO;
import com.example.jpetstore.POJO.ViewObject.CartVO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

/**
 * @author Raymond Li
 * @create 2023-04-01 17:01
 * @description
 */
@Mapper(componentModel = "spring")
public interface CartMapping {
    /**
     * 将CartDO转为CartVO
     */
    @Mapping(target = "cartItemId", source = "cartDO.cartItemId")
    @Mapping(target = "productId", source = "cartDO.productId")
    @Mapping(target = "itemId", source = "cartDO.itemId")
    @Mapping(target = "quantity", source = "cartDO.quantity")
    @Mapping(target = "productNameChinese", source = "petProductDO.productNameChinese")
    @Mapping(target = "productImage", source = "petProductDO.productImage")
    @Mapping(target = "supplierId", source = "petProductDO.supplierId")
    @Mapping(target = "itemSpecification", source = "petItemDO.itemSpecification")
    @Mapping(target = "itemPrice", source = "petItemDO.itemPrice")
    @Mapping(target = "itemStock", source = "petItemDO.itemStock")
    public CartVO toCartVO(CartDO cartDO, PetProductDO petProductDO, PetItemDO petItemDO);
}
