package com.zlp.jpetstore_spring.controller;

import com.zlp.jpetstore_spring.service.PetService;
import com.zlp.jpetstore_spring.service.impl.PetServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

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
    public String showIndex(Model model, HttpSession httpSession){
        setModel(model);
        return "/Pet/Index";
    }

    @GetMapping("/Search.html")
    public String showSearch(){
        return "/Pet/Search";
    }

    public void setModel(Model model){
        String[] names = {"狗狗","猫咪","小宠","水族","爬虫"};
        String[] listNames = {"dogList","catList","smallList", "fishList", "pythonList"};
        for(int i = 0; i<5; i++){
            model.addAttribute(listNames[i],petService.getPetProductListByCategory(names[i]));
        }
    }
}
