package com.zlp.jpetstore_spring.mapper;

import com.zlp.jpetstore_spring.entity.PetItem;
import com.zlp.jpetstore_spring.entity.PetProduct;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:17
 * @description
 */
@Mapper
public interface PetMapper {
    List<PetProduct> getPetProductListByCategory(String Category);
    List<PetItem> getPetItemListByProductId(String ProductId);

}
