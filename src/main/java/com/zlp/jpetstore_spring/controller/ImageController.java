package com.zlp.jpetstore_spring.controller;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/**
 * @author Raymond Li
 * @create 2023-03-17 14:39
 * @description
 */
@Controller
public class ImageController {
    @GetMapping("/verificationCode")
    public void verificationCode(HttpSession session, HttpServletResponse resp) throws IOException {
        int width = 60;
        int height = 20;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = (Graphics2D) image.getGraphics();

        //画背景
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);

        // 画边框
        g.setColor(Color.BLACK);
        g.drawRect(0, 0, width - 1, height - 1);

        //产生随机验证码
        String chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
        char[] rands = new char[4];
        for (int i = 0; i < 4; i++) {
            int rand = (int) (Math.random() * 32);
            rands[i] = chars.charAt(rand);
        }
        session.setAttribute("checkCode", new String(rands));

        //画字符
        g.setColor(Color.BLACK);
        g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 18));
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
            resp.setDateHeader("Expires", 0);

            ImageIO.write(image, "JPEG", baos);
            byte[] buffer = baos.toByteArray();
            resp.setContentLength(buffer.length);
            sos.write(buffer);
        }
    }
}
