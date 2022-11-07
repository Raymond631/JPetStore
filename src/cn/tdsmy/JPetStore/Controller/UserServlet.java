package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Service.UserService;
import cn.tdsmy.JPetStore.Service.impl.UserServiceImpl;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/28 13:04
 * @Version 1.0
 */
@WebServlet("/User/*")
public class UserServlet extends HttpServlet
{
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        urlDistribute(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        if (userService == null)
        {
            userService = new UserServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url)
        {
            case "/showRegister"://注册
                showRegister(req, resp);
                break;
            case "/register"://注册判断
                register(req, resp);
                break;
            case "/showLogin"://登录
                showLogin(req, resp);
                break;
            case "/login"://登录判断
                login(req, resp);
                break;
            case "/signOut"://退出登录
                signOut(req, resp);
                break;
            case "/personalCenter"://个人中心
                personalCenter(req, resp);
                break;
            case "/updateUser"://更新用户信息
                updateUser(req, resp);
                break;
            case "/verificationCode"://验证码
                verificationCode(req, resp);
                break;
        }
    }


    public void showRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
    }

    public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String vCode = req.getParameter("vCode");//获得输入的验证码值
        String checkCode = (String) req.getSession().getAttribute("checkCode");//获取图片的值
        if (!vCode.equalsIgnoreCase(checkCode))//验证码错误
        {
            req.setAttribute("messageBox", "Invalid Verification Code.");
            req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
        }
        else
        {
            //获取用户输入的用户名和密码
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);

            if (userService.register(user))//注册成功
            {
                req.getSession().setAttribute("user", user);
                resp.sendRedirect(req.getContextPath() + "/Pet/homePage");//请求重定向，避免刷新时重复提交表单
            }
            else//用户名已存在
            {
                req.setAttribute("messageBox", "Username already exists.");
                req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
            }
        }
    }

    public void showLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String vCode = req.getParameter("vCode");//获得输入的验证码值
        String checkCode = (String) req.getSession().getAttribute("checkCode");//获取图片的值
        if (!vCode.equalsIgnoreCase(checkCode))//验证码错误
        {
            req.setAttribute("messageBox", "Invalid Verification Code.");
            req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
        }
        else
        {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);

            if (userService.login(user))//登录成功
            {
                req.getSession().setAttribute("user", user);
                req.getRequestDispatcher("/WEB-INF/jsp/Pet/HomePage.jsp").forward(req, resp);
            }
            else//用户名或密码错误
            {
                req.setAttribute("messageBox", "Invalid username or password.");
                req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
            }
        }
    }

    public void signOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.getSession().setAttribute("user", null);
        resp.sendRedirect(req.getContextPath() + "/Pet/homePage");
    }

    public void personalCenter(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        User user = (User) req.getSession().getAttribute("user");
        Receiver receiver = userService.getReceiver(user.getUsername());
        req.setAttribute("receiver", receiver);
        req.getRequestDispatcher("/WEB-INF/jsp/User/PersonalCenter.jsp").forward(req, resp);
    }

    public void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        User user = (User) req.getSession().getAttribute("user");
        String password = req.getParameter("newPassword");
        if (password.equals(""))
        {
            password = user.getPassword();
        }
        String receiverName = req.getParameter("receiverName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String country = req.getParameter("country");
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String detailedAddress = req.getParameter("detailedAddress");
        Receiver receiver = new Receiver(receiverName, email, phone, country, province, city, district, detailedAddress);
        user.setPassword(password);
        user.setReceiver(receiver);

        userService.updateUser(user);

        resp.sendRedirect("../User/personalCenter");
    }

    public void verificationCode(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("image/jpeg");
        HttpSession session = req.getSession();
        int width = 100 ;
        int height = 60;
        //设置浏览器不要缓存此图片
        resp.setHeader("Pragma", "No-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", 0);

        //创建内存图像并获得图形上下文
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //获取图片画笔
        Graphics g = image.getGraphics();

        //产生随机验证码
        String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        char[] rands = new char[4];
        for (int i = 0; i < 4; i++)
        {
            int rand = (int) (Math.random() * 36);
            rands[i] = chars.charAt(rand);

        }
        //产生图像
        g.setColor(new Color(0xDCDCDC));
        g.fillRect(0, 0, width, height);

        //随机产生120个干扰点
        for (int i = 0; i < 120; i++)
        {
            int x = (int) (Math.random() * width);
            int y = (int) (Math.random() * height);
            int red = (int) (Math.random() * 255);
            int green = (int) (Math.random() * 255);
            int blue = (int) (Math.random() * 255);
            g.setColor(new Color(red, green, blue));
            g.drawOval(x, y, 1, 0);
        }
        g.setColor(Color.BLACK);
        g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 18));

        //在不同高度输出验证码的不同字符
        g.drawString("" + rands[0], 1, 17);
        g.drawString("" + rands[1], 16, 15);
        g.drawString("" + rands[2], 31, 18);
        g.drawString("" + rands[3], 46, 16);
        g.dispose();

        //将图像上传到客户端
        ServletOutputStream sos = resp.getOutputStream();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image, "JPEG", baos);
        byte[] buffer = baos.toByteArray();
        resp.setContentLength(buffer.length);
        sos.write(buffer);
        baos.close();
        sos.close();
        session.setAttribute("checkCode", new String(rands));
    }
}
