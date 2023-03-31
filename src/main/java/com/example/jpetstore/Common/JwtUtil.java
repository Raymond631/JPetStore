package com.example.jpetstore.Common;

import com.example.jpetstore.POJO.DataObject.UserInfoDO;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Raymond Li
 * @create 2023-03-31 23:59
 * @description
 */
@Slf4j
public class JwtUtil {

    /**
     * 令牌密码（要大于100位,不能含下划线)
     */
    private static final String SECRET = "7b3ca53a72e240739fb51cbc4561204awifajksfn456486789f4a65sd4f23a1c56as4f56a41fsd4fasf4s231cda6s54df56a";

    /**
     * 令牌过期时间,单位为秒,默认1800秒
     */
    private static final Long EXPIRE_SECONDS = 3600L;


    /**
     * 生成令牌
     */
    public static String generateToken(Map<String, Object> map) {
        String jwt = Jwts.builder()
                .setClaims(map)
                .signWith(Keys.hmacShaKeyFor(Decoders.BASE64.decode(SECRET)), SignatureAlgorithm.HS512)
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE_SECONDS * 1000))
                .compact();
        return jwt;
    }

    /**
     * 验证令牌
     */
    public static Map<String, Object> resolveToken(String token) {
        if (token == null) {
            throw new JwtException("令牌为空");
        }
        try {
            return Jwts.parserBuilder().setSigningKey(Keys.hmacShaKeyFor(Decoders.BASE64.decode(SECRET))).build()
                    .parseClaimsJws(token)
                    .getBody();
        } catch (ExpiredJwtException e) {
            throw new JwtException("令牌已过期");
        } catch (Exception e) {
            throw new JwtException("令牌解析异常");
        }
    }

    /**
     * Object转Map
     */
    public static Map<String, Object> userInfoDOtoMap(UserInfoDO userInfo) {
        Map<String, Object> userMap = new HashMap<>();
        userMap.put("userId", userInfo.getUserId());
        userMap.put("nickname", userInfo.getNickname());
        userMap.put("receiverName", userInfo.getReceiverName());
        userMap.put("receiverPhone", userInfo.getReceiverPhone());
        userMap.put("receiverAddress", userInfo.getReceiverAddress());
        return userMap;
    }
}

