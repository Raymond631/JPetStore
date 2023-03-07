package com.zlp.jpetstore_spring.service.impl;

import com.zlp.jpetstore_spring.mapper.CartMapper;
import com.zlp.jpetstore_spring.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:16
 * @description
 */
@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartMapper cartMapper;
}
