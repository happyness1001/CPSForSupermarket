package com.qfedu.fmmall.service;

import com.qfedu.fmmall.entity.GoodsReturnApply;
import com.qfedu.fmmall.entity.Orders;
import com.qfedu.fmmall.entity.ReturnGoods;
import com.qfedu.fmmall.vo.ResultVO;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

public interface OrderService {

    public Map<String,String> addOrder(String cids, Orders order) throws SQLException;

    public Map<String,String> addOrder2(String cids, Orders order) throws SQLException;

    public int updateOrderStatus(String orderId, String status);

    public ResultVO getOrderById(String orderId);

    public ResultVO closeOrder(String orderId);

    public ResultVO listOrders(String userId,String status,int pageNum, int limit);

    public ResultVO listAreas();

    public ResultVO getAreaById(Integer pid);

    public ResultVO deleteOrder(String orderId);

    public ResultVO confirmReceipt(String orderId);

    public ResultVO changeTime(String orderId, Orders orders);

    public int updateReconciliation(String orderId, BigDecimal money);

    public ResultVO returnGoods(ReturnGoods returnGoods);

    public ResultVO returnRequest(GoodsReturnApply goodsReturnApply);

    public ResultVO selectOrder(String oid);

    public ResultVO getReconciliation(String oid);

    public ResultVO changeOrderStatus(String orderId, String status);
}
