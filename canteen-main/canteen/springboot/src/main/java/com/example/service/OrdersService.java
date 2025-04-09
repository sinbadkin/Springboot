package com.example.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import com.example.entity.Orders;
import com.example.entity.User;
import com.example.exception.ArgumentException;//待定
import com.example.exception.CustomException;
import com.example.exception.StateException;//待定
import com.example.mapper.OrdersMapper;
import com.example.mapper.UserMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class OrdersService {

    @Resource
    OrdersMapper ordersMapper;

    @Resource
    UserMapper userMapper;


    public void add(Orders orders) {
        // 设置唯一的订单号
        String orderNo = IdUtil.fastSimpleUUID();
        orders.setOrderNo(orderNo);
        orders.setTime(DateUtil.now());  // 当前的年月日 时分秒
        ordersMapper.insert(orders);
    }

    public void deleteById(Integer id) {
        ordersMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            this.deleteById(id);
        }
    }

    public void updateById(Orders orders) {
        // 扣减用户余额
        if (orders.getStatus().equals("已完成")) {
            User user = userMapper.selectById(orders.getUserId());
            // 扣减余额
            BigDecimal total = orders.getTotal();
            BigDecimal account = user.getAccount().subtract(total);
            if (account.doubleValue() < 0) {
                throw new CustomException("账户余额不足");
            }
            //从这开始
//            if (orders.getOrderNo() == null) {
//                throw new ArgumentException("订单不存在");
//            }
//            if (!orders.getStatus().equals("待结算")) {
//                throw new StateException("订单状态不是待结算状态");
//            }
            //从这结束
            user.setAccount(account);
            userMapper.updateById(user);
        }
        ordersMapper.updateById(orders);
    }

    public Orders selectById(Integer id) {
        return ordersMapper.selectById(id);
    }

    public List<Orders> selectAll(String userName, Integer userId) {
        return ordersMapper.selectAll(userName, userId);
    }

    public PageInfo<Orders> selectPage(String userName, Integer userId, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Orders> list = this.selectAll(userName, userId);
        return PageInfo.of(list);
    }

}
