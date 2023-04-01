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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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

    // @GetMapping("/image/look/{imageName}")
    // public void imageLook(@PathVariable("imageName") String imageName, HttpServletResponse response) {
    //     File file = new File("D:/jpetstoreImage/" + imageName);
    //     byte[] bytes = new byte[1024];
    //     try (OutputStream os = response.getOutputStream(); FileInputStream fis = new FileInputStream(file)) {
    //         while ((fis.read(bytes)) != -1) {
    //             os.write(bytes);
    //             os.flush();
    //         }
    //     } catch (IOException e) {
    //         e.printStackTrace();
    //     }
    // }
}
