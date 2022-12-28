package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.Product;
import cn.tdsmy.JPetStore.Service.LogService;
import cn.tdsmy.JPetStore.Service.PetService;
import cn.tdsmy.JPetStore.Service.impl.LogServiceImpl;
import cn.tdsmy.JPetStore.Service.impl.PetServiceImpl;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/29 22:59
 * @Version 1.0
 */

@WebServlet("/Pet/*")
public class PetServlet extends HttpServlet {
    public PetService petService;
    private LogService logService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (petService == null) {
            petService = new PetServiceImpl();
        }
        if (logService == null) {
            logService = new LogServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url) {
            case "/homePage":
                homePage(req, resp);//主页
                break;
            case "/searchPet":
                searchPet(req, resp);//搜索
                break;
            case "/petList":
                petList(req, resp);//大类，展示每个Category中所有的Product
                break;
            case "/petProduct":
                petProduct(req, resp);//小类，展示每个Product中所有的Item
                break;
            case "/searchTips":
                searchTips(req, resp);//小类，展示每个Product中所有的Item
                break;
        }
    }


    public void homePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logService.addLog(req, "Other", "查看首页", "true");
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/HomePage.jsp").forward(req, resp);
    }

    public void searchPet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("keyword");
        Map<String, Product> productMap = petService.searchPet(key);
        req.setAttribute("productMap", productMap);

        logService.addLog(req, "Read", "搜索宠物,keyword=" + key, "true");
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/PetSearch.jsp").forward(req, resp);
    }

    /**
     * 参数/petList?category=
     */
    public void petList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        Map<String, Product> productMap = petService.getProductMap(category);
        req.getSession().setAttribute("category", category);
        req.getSession().setAttribute("productMap", productMap);

        logService.addLog(req, "Read", "查看宠物列表,category=" + category, "true");
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/Category.jsp").forward(req, resp);
    }

    /**
     * 参数/petProduct?productID= &search=
     */
    public void petProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");//如果不是从search中眺过来的，可以直接从session中获取信息，不用再查数据库
        String productID = req.getParameter("productID");
        if (search.equals("false")) {
            Map<String, Product> productMap = (Map<String, Product>) req.getSession().getAttribute("productMap");
            Product product = productMap.get(productID);
            req.setAttribute("product", product);
        }
        else if (search.equals("true")) {
            Product product = petService.getProduct(productID);
            req.setAttribute("product", product);
        }

        logService.addLog(req, "Read", "查看宠物详情,productID=" + productID, "true");
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/PetProduct.jsp").forward(req, resp);
    }

    public void searchTips(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Product> ProductList = petService.searchTips(keyword);
        String SearchResult = JSON.toJSONString(ProductList);
        System.out.println(SearchResult);
        resp.setContentType("text/plain");
        resp.setHeader("Access-Control-Allow-Origin", "*");//跨域，这里其实不需要设置
        PrintWriter out = resp.getWriter();
        out.println(SearchResult);
    }
}
