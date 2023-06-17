package com.example.jpetstore.Service.impl;

import com.alibaba.fastjson.JSON;
import com.example.jpetstore.Mapper.PetMapper;
import com.example.jpetstore.POJO.DataObject.PetProductDO;
import com.example.jpetstore.Service.PetService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author Raymond Li
 * @create 2023-04-01 1:14
 * @description
 */
@Service
@Slf4j
public class PetServiceImpl implements PetService {
    @Autowired
    private PetMapper petMapper;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public String getPetList(String category) {
        String englishName = petNameMap(category);
        String json = stringRedisTemplate.opsForValue().get(englishName);
        if (json == null || json.equals("")) {
            log.info("缓存未命中");
            json = JSON.toJSONString(petMapper.getPetList(category));
            stringRedisTemplate.opsForValue().set(englishName, json);
            stringRedisTemplate.expire(englishName, 10, TimeUnit.MINUTES);
        }
        return json;
    }

    private String petNameMap(String chineseName) {
        switch (chineseName) {
            case "狗狗" -> {
                return "dog";
            }
            case "猫咪" -> {
                return "cat";
            }
            case "小宠" -> {
                return "bird";
            }
            case "水族" -> {
                return "fish";
            }
            case "爬虫" -> {
                return "reptile";
            }
            default -> {
                throw new RuntimeException("参数错误");
            }
        }
    }

    @Override
    public PetProductDO getPetDetail(int productId) {
        return petMapper.getPetDetail(productId);
    }

    @Override
    public List<PetProductDO> searchPet(String keyword) {
        return petMapper.searchPet(keyword);
    }

    @Override
    public List<String> searchTip(String keyword) {
        return petMapper.searchTip(keyword);
    }
}
