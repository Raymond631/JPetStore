package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:10
 * @description
 */
@Controller
@RequestMapping("/Pet")
public class PetController {
    @Autowired
    private PetService petService;

    @GetMapping("/Details.html")
    public String showDetails(){
        return "/Pet/Details";
    }

    @GetMapping("/Index.html")
    public String showIndex(){
        return "/Pet/Index";
    }

    @GetMapping("/Search.html")
    public String showSearch(){
        return "/Pet/Search";
    }
}
