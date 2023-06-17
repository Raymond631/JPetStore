package com.example.jpetstore.Controller;

import com.example.jpetstore.Common.CommonResponse;
import com.example.jpetstore.Common.JwtUtil;
import com.example.jpetstore.POJO.DataObject.CartDO;
import com.example.jpetstore.Service.CartService;
import io.jsonwebtoken.JwtException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:11
 * @description
 */
@RestController
public class CartController {
    @Autowired
    private CartService cartService;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @GetMapping("/cart")
    public CommonResponse selectCartList(@CookieValue("token") String token) {
        if (stringRedisTemplate.opsForValue().get("user:" + token) == null) {
            throw new JwtException("token已过期，请重新登陆");
        }
        int userId = (int) JwtUtil.resolveToken(token).get("userId");
        return CommonResponse.success(cartService.selectCartList(userId));
    }

    /**
     * 前端用json发送
     * cart中只需包含 productId,itemId,quantity 这3个字段
     */
    @PostMapping("/cart")
    public CommonResponse addCartItem(@RequestBody CartDO cartDO, @CookieValue("token") String token) {
        if (stringRedisTemplate.opsForValue().get("user:" + token) == null) {
            throw new JwtException("token已过期，请重新登陆");
        }
        int userId = (int) JwtUtil.resolveToken(token).get("userId");
        cartDO.setUserId(userId);
        cartService.addCartItem(cartDO);
        return CommonResponse.success("加入购物车成功");
    }

    /**
     * 前端用json发送
     * cart中只需包含 cartItemId,quantity 这2个字段
     */
    @PutMapping("/cart")
    public CommonResponse updateItemQuantity(@RequestBody CartDO cartDO) {
        cartService.updateItemQuantity(cartDO);
        return CommonResponse.success("购物车宠物数量修改成功");
    }

    @DeleteMapping("/cart/{cartItemId}")
    public CommonResponse removeCartItem(@PathVariable("cartItemId") int cartItemId) {
        cartService.removeCartItem(cartItemId);
        return CommonResponse.success("购物车宠物移除成功");
    }
}
