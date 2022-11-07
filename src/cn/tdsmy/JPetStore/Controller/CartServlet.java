package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.CartItem;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Entity.UserLog;
import cn.tdsmy.JPetStore.Service.CartService;
import cn.tdsmy.JPetStore.Service.LogService;
import cn.tdsmy.JPetStore.Service.impl.CartServiceImpl;
import cn.tdsmy.JPetStore.Service.impl.LogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/23 23:28
 * @Version 1.0
 */

@WebServlet("/Cart/*")
public class CartServlet extends HttpServlet
{
    private CartService cartService;
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
        if (cartService == null)
        {
            cartService = new CartServiceImpl();
        }
        if (logService == null)
        {
            logService = new LogServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url)
        {
            case "/cartList":
                cartList(req, resp);
                break;
            case "/addCartItem":
                addCartItem(req, resp);
                break;
            case "/updateCart":
                updateCart(req, resp);
                break;
            case "/removeCartItem":
                removeCartItem(req, resp);
                break;
        }
    }

    /**
     * get请求;  注意：“增删改”用请求重定向，防止用户重复提交表单
     */
    public void cartList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        UserLog userLog = (UserLog) req.getAttribute("myLog");//日志
        User user = (User) req.getSession().getAttribute("user");
        if (user == null)
        {
            userLog.setLog("Read", "查看购物车", "false");
            logService.addLog(userLog);
            resp.sendRedirect(req.getContextPath() + "/User/showLogin");
        }
        else
        {
            List<CartItem> cartItemList = cartService.selectCartList(user.getUsername());
            BigDecimal allCost = cartService.getAllCost(cartItemList);
            req.getSession().setAttribute("cartItemList", cartItemList);
            req.getSession().setAttribute("allCost", allCost);

            userLog.setLog("Read", "查看购物车", "true");
            logService.addLog(userLog);
            req.getRequestDispatcher("/WEB-INF/jsp/Cart/Cart.jsp").forward(req, resp);
        }
    }

    /**
     * get请求
     * 参数/addCartItem?itemID
     */
    public void addCartItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        UserLog userLog = (UserLog) req.getAttribute("myLog");//日志
        User user = (User) req.getSession().getAttribute("user");
        if (user == null)
        {
            userLog.setLog("Create", "加入购物车", "false");
            logService.addLog(userLog);
            resp.sendRedirect(req.getContextPath() + "/User/showLogin");
        }
        else
        {
            String itemID = req.getParameter("itemID");
            cartService.addCartItem(user.getUsername(), itemID, 1);

            userLog.setLog("Create", "加入购物车,itemID=" + itemID, "true");
            logService.addLog(userLog);
            resp.sendRedirect(req.getContextPath() + "/Cart/cartList");
        }
    }

    /**
     * post请求
     */
    public void updateCart(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        UserLog userLog = (UserLog) req.getAttribute("myLog");//日志
        User user = (User) req.getSession().getAttribute("user");
        Enumeration<String> itemList = req.getParameterNames();
        while (itemList.hasMoreElements())
        {
            String itemID = itemList.nextElement();
            int quantity = Integer.parseInt(req.getParameter(itemID));
            cartService.updateCart(user.getUsername(), itemID, quantity);
        }
        userLog.setLog("Update", "修改购物车商品数量", "true");
        logService.addLog(userLog);
        resp.sendRedirect(req.getContextPath() + "/Cart/cartList");
    }

    /**
     * get请求
     * url带参数 /removeCartItem?itemID=
     * itemID=0时,清空购物车
     */
    public void removeCartItem(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        UserLog userLog = (UserLog) req.getAttribute("myLog");//日志
        User user = (User) req.getSession().getAttribute("user");
        String itemID = req.getParameter("itemID");
        cartService.removeCartItem(user.getUsername(), itemID);

        userLog.setLog("Delete", itemID.equals("0") ? "清空购物车" : "移出购物车，itemID=" + itemID, "true");
        logService.addLog(userLog);
        resp.sendRedirect(req.getContextPath() + "/Cart/cartList");
    }
}
