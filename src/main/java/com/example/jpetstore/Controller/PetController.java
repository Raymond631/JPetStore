package com.example.jpetstore.Controller;

import com.example.jpetstore.Common.CommonResponse;
import com.example.jpetstore.POJO.DataObject.PetProductDO;
import com.example.jpetstore.Service.PetService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:10
 * @description
 */
@RestController
public class PetController {
    @Autowired
    private PetService petService;

    @GetMapping("/pets")
    public CommonResponse getPetList(){
        Map<String,List<PetProductDO>> petMap=new HashMap<>();
        petMap.put("dog",petService.getPetList("狗狗"));
        petMap.put("cat",petService.getPetList("猫咪"));
        petMap.put("bird",petService.getPetList("小宠"));
        petMap.put("fish",petService.getPetList("水族"));
        petMap.put("reptile",petService.getPetList("爬虫"));
        return CommonResponse.success(petMap);
    }

    @GetMapping("/pets/{productId}")
    public CommonResponse getPetDetail(@PathVariable("productId") int productId){
        return CommonResponse.success(petService.getPetDetail(productId));
    }
    @GetMapping("/pets/searchTip")
    public CommonResponse searchTip(@RequestParam("keyword") String keyword){
        return CommonResponse.success(petService.searchTip(URLDecoder.decode(keyword, StandardCharsets.UTF_8)));
    }

    @GetMapping("/pets/search")
    public CommonResponse searchPet(@RequestParam("keyword") String keyword){
        return CommonResponse.success(petService.searchPet(URLDecoder.decode(keyword, StandardCharsets.UTF_8)));
    }



}
