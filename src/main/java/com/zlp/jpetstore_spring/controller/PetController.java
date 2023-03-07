package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.service.CartService;
import com.zlp.jpetstore_spring.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:10
 * @description
 */
@RestController
@RequestMapping("/pet")
public class PetController {
    @Autowired
    private PetService petService;
}
