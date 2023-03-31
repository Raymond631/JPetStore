package com.example.jpetstore.Service.impl;

import com.example.jpetstore.Mapper.PetMapper;
import com.example.jpetstore.POJO.DataObject.PetProductDO;
import com.example.jpetstore.Service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-04-01 1:14
 * @description
 */
@Service
public class PetServiceImpl implements PetService {
    @Autowired
    private PetMapper petMapper;

    @Override
    public List<PetProductDO> getPetList(String category) {
        return petMapper.getPetList(category);
    }
}
