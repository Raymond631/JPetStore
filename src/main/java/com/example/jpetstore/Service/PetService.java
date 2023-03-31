package com.example.jpetstore.Service;

import com.example.jpetstore.POJO.DataObject.PetProductDO;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-04-01 1:13
 * @description
 */
public interface PetService {

    List<PetProductDO> getPetList(String category);
}
