package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.Product;
import cn.tdsmy.JPetStore.Entity.UserLog;
import cn.tdsmy.JPetStore.Service.LogService;
import cn.tdsmy.JPetStore.Service.PetService;
import cn.tdsmy.JPetStore.Service.impl.LogServiceImpl;
import cn.tdsmy.JPetStore.Service.impl.PetServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/29 22:59
 * @Version 1.0
 */

@WebServlet("/Pet/*")
public class PetServlet extends HttpServlet
{
    public PetService petService;
    private LogService logService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        urlDistribute(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (petService == null)
        {
            petService = new PetServiceImpl();
        }
        if (logService == null)
        {
            logService = new LogServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url)
        {
            case "/homePage":
                homePage(req, resp);
                break;
            case "/searchPet":
                searchPet(req, resp);
                break;
            case "/petList":
                petList(req, resp);
                break;
            case "/petProduct":
                petProduct(req, resp);
                break;
        }
    }

    /**
     * get请求
     */
    public void homePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        UserLog userLog = (UserLog) req.getAttribute("myLog");//日志
        userLog.setLog("Other", "查看首页", "true");
        logService.addLog(userLog);
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/HomePage.jsp").forward(req, resp);
    }

    /**
     * post请求
     */
    public void searchPet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        UserLog userLog = (UserLog) req.getAttribute("myLog");//日志
        String key = req.getParameter("keyword");
        Map<String, Product> productMap = petService.searchPet(key);
        req.setAttribute("productMap", productMap);

        userLog.setLog("Read", "搜索宠物,keyword=" + key, "true");
        logService.addLog(userLog);
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/PetSearch.jsp").forward(req, resp);
    }

    /**
     * get请求
     * 参数/petList?category=
     */
    public void petList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        UserLog userLog = (UserLog) req.getAttribute("myLog");//日志
        String category = req.getParameter("category");
        Map<String, Product> productMap = petService.getProductMap(category);

        req.getSession().setAttribute("category", category);
        req.getSession().setAttribute("productMap", productMap);

        userLog.setLog("Read", "查看宠物列表,category=" + category, "true");
        logService.addLog(userLog);
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/Category.jsp").forward(req, resp);
    }

    /**
     * get请求
     * 参数/petProduct?productID=
     */
    public void petProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        UserLog userLog = (UserLog) req.getAttribute("myLog");//日志
        String search = req.getParameter("search");
        String productID = req.getParameter("productID");
        if (search.equals("false"))
        {
            Map<String, Product> productMap = (Map<String, Product>) req.getSession().getAttribute("productMap");
            Product product = productMap.get(productID);
            req.setAttribute("product", product);
        }
        else if (search.equals("true"))
        {
            Product product = petService.getProduct(productID);
            req.setAttribute("product", product);
        }

        userLog.setLog("Read", "查看宠物详情,productID=" + productID, "true");
        logService.addLog(userLog);
        req.getRequestDispatcher("/WEB-INF/jsp/Pet/PetProduct.jsp").forward(req, resp);
    }
}
