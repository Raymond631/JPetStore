package com.zlp.jpetstore_spring.service.impl;

import com.zlp.jpetstore_spring.entity.PetItem;
import com.zlp.jpetstore_spring.entity.PetProduct;
import com.zlp.jpetstore_spring.mapper.CartMapper;
import com.zlp.jpetstore_spring.mapper.PetMapper;
import com.zlp.jpetstore_spring.service.PetService;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Mapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:15
 * @description
 */
@Service
public class PetServiceImpl implements PetService {
    @Autowired
    private PetMapper petMapper;


    @Override
    public List<PetProduct> getPetProductListByCategory(String Category){
        List<PetProduct> PetProductList=petMapper.getPetProductListByCategory(Category);
        for(PetProduct petproduct:PetProductList){
            petproduct.setPetItemList(this.getPetItemListByProductId(String.valueOf(petproduct.getProductId())));
        }
        return PetProductList;
    }

    @Override
    public List<PetItem> getPetItemListByProductId(String ProductId){
        return petMapper.getPetItemListByProductId(ProductId);
    }

}
