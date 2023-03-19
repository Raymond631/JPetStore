package com.zlp.jpetstore_spring.service;

import com.zlp.jpetstore_spring.entity.PetItem;
import com.zlp.jpetstore_spring.entity.PetProduct;
import com.zlp.jpetstore_spring.mapper.PetMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:13
 * @description
 */
@Service
public interface PetService {
    public List<PetProduct> getPetProductListByCategory(String Category);

    public List<PetItem> getPetItemListByProductId(String ProductId);
}
