package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.Profile;
import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Entity.UserLog;
import cn.tdsmy.JPetStore.Service.LogService;
import cn.tdsmy.JPetStore.Service.UserService;
import cn.tdsmy.JPetStore.Service.impl.LogServiceImpl;
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
import java.io.PrintWriter;
import java.util.List;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/28 13:04
 * @Version 1.0
 */
@WebServlet("/User/*")
public class UserServlet extends HttpServlet {
    private UserService userService;
    private LogService logService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        urlDistribute(req, resp);
    }

    public void urlDistribute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (userService == null) {
            userService = new UserServiceImpl();
        }
        if (logService == null) {
            logService = new LogServiceImpl();
        }

        String url = req.getPathInfo();
        switch (url) {
            case "/showRegister"://注册页面
                showRegister(req, resp);
                break;
            case "/register"://注册判断
                register(req, resp);
                break;
            case "/showLogin"://登录页面
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
            case "/changePassword"://修改密码
                changePassword(req, resp);
                break;
            case "/updateReceiver"://更新收件人信息
                updateReceiver(req, resp);
                break;
            case "/updateProfile"://更新偏好信息
                updateProfile(req, resp);
                break;
            case "/verificationCode"://验证码
                verificationCode(req, resp);
                break;
            case "/userLog"://管理员查看日志
                userLog(req, resp);
                break;
            case "/UsernameExist"://判断用户名是否存在
                userExist(req, resp);
                break;
        }
    }


    public void showRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logService.addLog(req, "Other", "跳往注册界面", "true");
        req.getRequestDispatcher("/WEB-INF/jsp/User/Register.jsp").forward(req, resp);
    }

    public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vCode = req.getParameter("vCode");//获得输入的验证码值
        String checkCode = (String) req.getSession().getAttribute("checkCode");//获取图片的值
        if (!vCode.equalsIgnoreCase(checkCode))//验证码错误
        {
            req.setAttribute("messageBox", "Invalid Verification Code.");

            logService.addLog(req, "Other", "注册验证码错误", "false");
            req.getRequestDispatcher("/WEB-INF/jsp/User/Register.jsp").forward(req, resp);
        }
        else {
            //获取用户输入的用户名和密码
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);

            if (userService.register(user))//注册成功（进行用户名查重）
            {
                user.setReceiver(userService.getReceiver(username));
                user.setProfile(userService.getProfile(username));
                req.getSession().setAttribute("user", user);

                logService.addLog(req, "Create", "注册新用户,username=" + username, "true");
                resp.sendRedirect(req.getContextPath() + "/Pet/homePage");//请求重定向，避免刷新时重复提交表单
            }
            else//用户名已存在
            {
                req.setAttribute("messageBox", "Username already exists.");

                logService.addLog(req, "Read", "用户名重复，无法注册", "false");
                req.getRequestDispatcher("/WEB-INF/jsp/User/Register.jsp").forward(req, resp);
            }
        }
    }

    public void showLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logService.addLog(req, "Other", "跳往登录界面", "true");
        req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vCode = req.getParameter("vCode");//获得输入的验证码值
        String checkCode = (String) req.getSession().getAttribute("checkCode");//获取图片的值
        if (!vCode.equalsIgnoreCase(checkCode))//验证码错误
        {
            req.setAttribute("messageBox", "Invalid Verification Code.");

            logService.addLog(req, "Other", "登录验证码错误", "false");
            req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
        }
        else {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);

            if (userService.login(user))//登录成功
            {
                if (username.equals("root"))//超级管理员，登录后台界面
                {
                    req.getSession().setAttribute("user", user);

                    logService.addLog(req, "Read", "管理员查看用户日志" + username, "true");
                    resp.sendRedirect(req.getContextPath() + "/User/userLog");
                }
                else//普通用户
                {
                    user.setReceiver(userService.getReceiver(username));
                    user.setProfile(userService.getProfile(username));
                    req.getSession().setAttribute("user", user);//通过session保持登录状态

                    logService.addLog(req, "Read", "登录,username=" + username, "true");
                    resp.sendRedirect(req.getContextPath() + "/Pet/homePage");
                }
            }
            else//用户名或密码错误
            {
                req.setAttribute("messageBox", "Invalid username or password.");

                logService.addLog(req, "Read", "用户名或密码错误，登录失败", "false");
                req.getRequestDispatcher("/WEB-INF/jsp/User/Login.jsp").forward(req, resp);
            }
        }
    }

    public void signOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("user", null);

        logService.addLog(req, "Other", "退出登录", "true");
        resp.sendRedirect(req.getContextPath() + "/Pet/homePage");
    }

    public void personalCenter(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        user.setReceiver(userService.getReceiver(user.getUsername()));
        user.setProfile((userService.getProfile(user.getUsername())));
        req.getSession().setAttribute("user", user);

        logService.addLog(req, "Read", "查看个人中心", "true");
        req.getRequestDispatcher("/WEB-INF/jsp/User/PersonalCenter.jsp").forward(req, resp);
    }

    public void changePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String password = req.getParameter("newPassword");
        user.setPassword(password);
        userService.changePassword(user);

        logService.addLog(req, "Update", "修改密码", "true");
        resp.sendRedirect("../User/personalCenter");
    }

    public void updateReceiver(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String receiverName = req.getParameter("receiverName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String country = req.getParameter("country");
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String detailedAddress = req.getParameter("detailedAddress");
        Receiver receiver = new Receiver(receiverName, email, phone, country, province, city, district, detailedAddress);

        User user = (User) req.getSession().getAttribute("user");
        userService.updateReceiver(user.getUsername(), receiver);

        logService.addLog(req, "Update", "修改收件人信息", "true");
        resp.sendRedirect("../User/personalCenter");
    }

    public void updateProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String languagePreference = req.getParameter("languagePreference");
        String favouriteCategory = req.getParameter("favouriteCategory");
        String enableMyList = req.getParameter("enableMyList");
        String enableMyBanner = req.getParameter("enableMyBanner");
        Profile profile = new Profile(languagePreference, favouriteCategory, enableMyList, enableMyBanner);
        userService.updateProfile(user.getUsername(), profile);

        logService.addLog(req, "Update", "修改个人信息", "true");
        resp.sendRedirect("../User/personalCenter");
    }

    public void verificationCode(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int width = 60;
        int height = 20;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);//创建内存图像
        Graphics2D g = (Graphics2D) image.getGraphics();//获取图片画笔

        //画背景
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);

        // 画边框
        g.setColor(Color.BLACK);
        g.drawRect(0, 0, width - 1, height - 1);

        //产生随机验证码
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";//
        char[] rands = new char[4];
        for (int i = 0; i < 4; i++) {
            int rand = (int) (Math.random() * 36);
            rands[i] = chars.charAt(rand);
        }
        HttpSession session = req.getSession();
        session.setAttribute("checkCode", new String(rands));

        //画字符
        g.setColor(Color.BLACK);
        g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 18));//18号字，斜体加粗
        g.drawString("" + rands[0], 1, 17);
        g.drawString("" + rands[1], 16, 15);
        g.drawString("" + rands[2], 31, 18);
        g.drawString("" + rands[3], 46, 16);

        //画干扰点
        for (int i = 0; i < 120; i++) {
            int x = (int) (Math.random() * width);//坐标
            int y = (int) (Math.random() * height);

            int red = (int) (Math.random() * 255);//颜色
            int green = (int) (Math.random() * 255);
            int blue = (int) (Math.random() * 255);
            g.setColor(new Color(red, green, blue));

            g.drawOval(x, y, 1, 0);
        }

        // 画干扰线
//        g.setColor(Color.GREEN);
//        for (int i = 0; i < 4; i++) {
//            int x1 = (int) (Math.random() * width);
//            int y1 = (int) (Math.random() * height);
//            int x2 = (int) (Math.random() * width);
//            int y2 = (int) (Math.random() * height);
//            g.drawLine(x1, y1, x2, y2);
//        }

        //画完图像后，释放画笔
        g.dispose();

        //将图像传到客户端
        try (ServletOutputStream sos = resp.getOutputStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            resp.setContentType("image/jpeg");
            //设置浏览器不要缓存此图片
            resp.setHeader("Pragma", "No-cache");
            resp.setHeader("Cache-Control", "no-cache");
            resp.setDateHeader("Expires", 0);//过期时间

            ImageIO.write(image, "JPEG", baos);//写入二进制流
            byte[] buffer = baos.toByteArray();//转为二进制数组
            resp.setContentLength(buffer.length);//设置长度
            sos.write(buffer);//传回客户端
        }
    }

    public void userLog(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user.getUsername().equals("root"))//防止普通用户直接访问
        {
            List<UserLog> userLogList = logService.getLog();
            req.setAttribute("userLogList", userLogList);
            req.getRequestDispatcher("/WEB-INF/jsp/User/UserLog.jsp").forward(req, resp);
        }
    }

    public void userExist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        User user = new User();
        user.setUsername(username);
        //下面需要在数据库中查询是否存在该名字

        if (userService.registerSuccess(user))//注册成功（进行用户名查重）
        {
            resp.setContentType("text/plain");
            resp.setHeader("Access-Control-Allow-Origin", "*");
            PrintWriter out = resp.getWriter();
            out.println("");
        }
        else//用户名已存在
        {
            resp.setContentType("text/plain");
            resp.setHeader("Access-Control-Allow-Origin", "*");
            PrintWriter out = resp.getWriter();
            out.println("用户名已存在");
        }


    }
}
