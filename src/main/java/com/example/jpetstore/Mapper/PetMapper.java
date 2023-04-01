package com.example.jpetstore.Mapper;

import com.example.jpetstore.POJO.DataObject.PetProductDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-04-01 1:15
 * @description
 */
@Mapper
public interface PetMapper {

    List<PetProductDO> getPetList(String category);

    PetProductDO getPetDetail(int productId);

    List<PetProductDO> searchPet(String keyword);

    List<String> searchTip(String keyword);
}
