package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.CartItem;
import cn.tdsmy.JPetStore.Entity.Order;
import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.LogService;
import cn.tdsmy.JPetStore.Service.OrderService;
import cn.tdsmy.JPetStore.Service.impl.LogServiceImpl;
import cn.tdsmy.JPetStore.Service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/28 20:34
 * @Version 1.0
 */

@WebServlet("/Order/*")
public class OrderServlet extends HttpServlet
{
    private OrderService orderService;
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
        if (orderService == null)
        {
            orderService = new OrderServiceImpl();
        }
        if (logService == null)
        {
            logService = new LogServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url)
        {
            case "/orderSubmit":
                orderSubmit(req, resp);//创建订单
                break;
            case "/orderPay":
                orderPay(req, resp);//确认并支付订单
                break;
            case "/newOrder":
                newOrder(req, resp);//提交订单
                break;
            case "/deleteOrder":
                deleteOrder(req, resp);//删除订单
                break;
            case "/orderList":
                orderList(req, resp);//查看订单列表
                break;
            case "/orderItem":
                orderItem(req, resp);//查看订单详情
                break;
        }
    }


    public void orderSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        User user = (User) req.getSession().getAttribute("user");
        Receiver receiver = orderService.getReceiver(user.getUsername());
        req.setAttribute("receiver", receiver);

        logService.addLog(req, "Read", "查询收件人信息，生成订单", "true");
        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderSubmit.jsp").forward(req, resp);
    }

    public void orderPay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String Name = req.getParameter("Name");
        String Phone = req.getParameter("Phone");
        String Country = req.getParameter("Country");
        String Province = req.getParameter("Province");
        String City = req.getParameter("City");
        String District = req.getParameter("District");
        String Address = req.getParameter("Address");
        if (Address.equals(""))
        {
            logService.addLog(req, "Other", "跳往支付页面", "false");
            resp.sendRedirect(req.getContextPath() + "/User/personalCenter");
        }
        else
        {
            Receiver receiver = new Receiver();
            receiver.setReceiverName(Name);
            receiver.setPhoneNumber(Phone);
            receiver.setCountry(Country);
            receiver.setProvince(Province);
            receiver.setCity(City);
            receiver.setDistrict(District);
            receiver.setDetailedAddress(Address);

            req.getSession().setAttribute("receiver", receiver);

            logService.addLog(req, "Other", "跳往支付页面", "true");
            req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderPay.jsp").forward(req, resp);
        }
    }

    public void newOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Order order = new Order();
        String orderID = orderService.createOrderID();
        order.setOrderID(orderID);
        order.setOrderTime((String) req.getSession().getAttribute("OrderTime"));
        order.setPayTime(orderService.getTimeNow());
        order.setReceiver((Receiver) req.getSession().getAttribute("receiver"));
        order.setCartItemList((List<CartItem>) req.getSession().getAttribute("cartItemList"));
        order.setTotalPrice((BigDecimal) req.getSession().getAttribute("allCost"));
        order.setPayMethod(req.getParameter("payMethod"));

        User user = (User) req.getSession().getAttribute("user");
        orderService.addOrder(user.getUsername(), order);//插入数据库
        orderService.clearCart(user.getUsername());//清空购物车

        logService.addLog(req, "Create", "清空购物车,提交订单,orderID=" + orderID, "true");
        resp.sendRedirect(req.getContextPath() + "/Order/orderItem?orderID=" + orderID + "&newOrder=true");
    }

    /**
     * 参数/deleteOrder?orderID=
     */
    public void deleteOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String orderID = req.getParameter("orderID");
        orderService.deleteOrder(orderID);

        logService.addLog(req, "Delete", "Delete除订单，orderID=" + orderID, "true");
        resp.sendRedirect(req.getContextPath() + "/Order/orderList");
    }

    public void orderList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null)
        {
            logService.addLog(req, "Read", "查看订单列表", "false");
            resp.sendRedirect(req.getContextPath() + "/User/showLogin");
        }
        else
        {
            List<Order> orderList = orderService.selectOrderList(user.getUsername());
            req.setAttribute("orderList", orderList);

            logService.addLog(req, "Read", "查看订单列表", "true");
            req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderList.jsp").forward(req, resp);
        }
    }

    /**
     * 参数/orderItem?orderID=
     */
    public void orderItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String orderID = req.getParameter("orderID");
        String newOrder = req.getParameter("newOrder");
        Order order = orderService.selectOrder(orderID);
        req.setAttribute("order", order);
        if (newOrder.equals("true"))
        {
            req.setAttribute("newOrder", true);
        }
        else
        {
            req.setAttribute("newOrder", false);
        }

        logService.addLog(req, "Read", "查看订单详情,orderID=" + orderID, "true");
        req.getRequestDispatcher("/WEB-INF/jsp/Order/OrderItem.jsp").forward(req, resp);
    }
}
