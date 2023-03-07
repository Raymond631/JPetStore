package com.zlp.jpetstore_spring.service.impl;

import com.zlp.jpetstore_spring.mapper.CartMapper;
import com.zlp.jpetstore_spring.mapper.PetMapper;
import com.zlp.jpetstore_spring.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:15
 * @description
 */
@Service
public class PetServiceImpl implements PetService {
    @Autowired
    private PetMapper petMapper;
}
