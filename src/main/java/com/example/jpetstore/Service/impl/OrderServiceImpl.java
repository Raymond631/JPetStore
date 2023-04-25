package com.example.jpetstore.Service.impl;

import com.example.jpetstore.Mapper.OrderMapper;
import com.example.jpetstore.POJO.DataObject.OrderItemDO;
import com.example.jpetstore.POJO.DataObject.OrderMainDO;
import com.example.jpetstore.POJO.ViewObject.CartVO;
import com.example.jpetstore.POJO.ViewObject.OrderVO;
import com.example.jpetstore.Service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Raymond Li
 * @create 2023-04-01 14:33
 * @description
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<OrderMainDO> getOrderList(int userId) {
        return orderMapper.getOrderList(userId);
    }

    @Override
    public OrderMainDO getOrderDetails(int orderId) {
        return orderMapper.getOrderDetails(orderId);
    }

    /**
     * 确认收货
     */
    @Override
    public void confirmReceipt(int orderId) {
        orderMapper.confirmReceipt(orderId);
    }

    /**
     * 按照供应商拆单
     */
    @Override
    public List<OrderMainDO> splitOrder(OrderVO orderVO, int userId) {
        Map<Integer, List<CartVO>> map = new HashMap<>();
        for (CartVO cartVO : orderVO.getCartList()) {
            if (!map.containsKey(cartVO.getSupplierId())) {
                // 如果该supplier_id是第一次出现
                List<CartVO> list = new ArrayList<>();
                list.add(cartVO);
                map.put(cartVO.getSupplierId(), list);
            } else {
                // 如果该supplier_id之前已经出现过了
                map.get(cartVO.getSupplierId()).add(cartVO);
            }
        }

        List<OrderMainDO> orderMainDOList = new ArrayList<>();
        map.forEach((supplierId, cartList) -> {
            // 封装一个订单
            OrderMainDO orderMainDO = new OrderMainDO();
            orderMainDO.setUserId(userId);
            orderMainDO.setOrderTime(getTimeNow());
            orderMainDO.setOrderCost(calculateOrderCost(cartList));
            orderMainDO.setOrderPayment(orderVO.getOrderPayment());
            orderMainDO.setReceiverName(orderVO.getReceiverName());
            orderMainDO.setReceiverPhone(orderVO.getReceiverPhone());
            orderMainDO.setReceiverAddress(orderVO.getReceiverAddress());
            orderMainDO.setSupplierId(supplierId);
            orderMainDO.setStatus(1);
            List<OrderItemDO> orderItemDOList = new ArrayList<>();
            for (CartVO cartVO : cartList) {
                OrderItemDO orderItemDO = new OrderItemDO();
                orderItemDO.setItemId(cartVO.getItemId());
                orderItemDO.setProductId(cartVO.getProductId());
                orderItemDO.setItemImage(cartVO.getProductImage());
                orderItemDO.setProductNameChinese(cartVO.getProductNameChinese());
                orderItemDO.setItemSpecification(cartVO.getItemSpecification());
                orderItemDO.setItemPrice(cartVO.getItemPrice());
                orderItemDO.setItemQuantity(cartVO.getQuantity());
                orderItemDOList.add(orderItemDO);
            }
            orderMainDO.setOrderItemDOList(orderItemDOList);

            // 封装完毕，插入订单List
            orderMainDOList.add(orderMainDO);
        });
        return orderMainDOList;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean newOrder(List<OrderMainDO> orderMainDOList) {
        for (OrderMainDO orderMainDO : orderMainDOList) {
            // 插入一个订单
            orderMapper.insertOrderMain(orderMainDO);
            // 插入一个订单的item清单
            for (OrderItemDO orderItemDO : orderMainDO.getOrderItemDOList()) {
                // 用插入订单时返回的自增主键给orderId赋值
                orderItemDO.setOrderId(orderMainDO.getOrderId());
                orderMapper.insertOrderItem(orderItemDO);

                // 修改库存
                int row1 = orderMapper.updateStock(orderItemDO.getItemId(), orderItemDO.getItemQuantity());
                if (row1 != 1) {
                    throw new RuntimeException("库存不足");
                }

                // 从购物车移除
                int row2 = orderMapper.removeFromCart(orderMainDO.getUserId(), orderItemDO.getItemId());
                if (row2 != 1) {
                    throw new RuntimeException("下单失败，请稍后重试");
                }
            }
        }
        return true;
    }


    public String getTimeNow() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    public BigDecimal calculateOrderCost(List<CartVO> cartVOList) {
        BigDecimal cost = new BigDecimal("0");
        for (CartVO cartVO : cartVOList) {
            BigDecimal temp = cartVO.getItemPrice().multiply(new BigDecimal(String.valueOf(cartVO.getQuantity())));
            cost = cost.add(temp);
        }
        return cost;
    }

}
