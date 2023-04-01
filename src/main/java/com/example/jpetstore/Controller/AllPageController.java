package com.example.jpetstore.Controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Raymond Li
 * @create 2023-04-01 0:23
 * @description
 */
@Controller
public class AllPageController {
    @GetMapping("/")
    public String show() {
        return "redirect:/Index.html";
    }

    @GetMapping("/NotLogin.html")
    public String showNotLogin() {
        return "Error/NotLogin";
    }

    @GetMapping("/Login.html")
    public String showLogin() {
        return "User/Login";
    }

    @GetMapping("/Register.html")
    public String showRegister() {
        return "User/Register";
    }

    @GetMapping("/SelfCenter.html")
    public String showSelfCenter() {
        return "User/SelfCenter";
    }

    @GetMapping("/MyCart.html")
    public String showMyCart() {
        return "Cart/MyCart";
    }

    @GetMapping("/MyOrder.html")
    public String showMyOrder() {
        return "Order/MyOrder";
    }

    @GetMapping("/OrderDetails.html")
    public String showOrderDetails() {
        return "Order/OrderDetails";
    }

    @GetMapping("/OrderSubmit.html")
    public String showOrderSubmit() {
        return "Order/OrderSubmit";
    }

    @GetMapping("/Details.html")
    public String showDetails(){
        return "Pet/Details";
    }

    @GetMapping("/Index.html")
    public String showIndex(){
        return "Pet/Index";
    }

    @GetMapping("/Search.html")
    public String showSearch(){
        return "Pet/Search";
    }
}
