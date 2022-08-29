package com.qfedu.fmmall.service.impl;

import com.qfedu.fmmall.dao.*;
import com.qfedu.fmmall.entity.*;
import com.qfedu.fmmall.service.OrderService;
import com.qfedu.fmmall.utils.PageHelper;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private ShoppingCartMapper shoppingCartMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private ProductSkuMapper productSkuMapper;

    @Autowired
    private AreaMapper areaMapper;

    private Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    /**
     * 保存订单业务
     */
    @Transactional
    public Map<String,String> addOrder(String cids,Orders order) throws SQLException {
        logger.info("add order begin...");
        Map<String,String> map = new HashMap<>();

        //1.校验库存：根据cids查询当前订单中关联的购物车记录详情（包括库存）
        String[] arr = cids.split(",");
        List<Integer> cidsList = new ArrayList<>();
        for (int i = 0; i <arr.length ; i++) {
            cidsList.add(Integer.parseInt(arr[i]));
        }
        List<ShoppingCartVO> list = shoppingCartMapper.selectShopcartByCids(cidsList);

        boolean f = true;
        String untitled = "";
        for (ShoppingCartVO sc: list) {
            if(Integer.parseInt(sc.getCartNum()) > sc.getSkuStock()){
                f = false;
            }
            //获取所有商品名称，以,分割拼接成字符串
            untitled = untitled+sc.getProductName()+",";
        }

        if(f){
//            System.out.println("-----库存校验完成");
            logger.info("product stock is OK...");
            //2.保存订单
            order.setUntitled(untitled);
            order.setCreateTime(new Date());
            order.setStatus("1");
            Date date = new Date();
            if(order.getDueTime().before(date)){
                Calendar ca = Calendar.getInstance();
                ca.setTime(date);
                int year = ca.get(Calendar.YEAR);
                int month = ca.get(Calendar.MONTH) + 1;
                if(month==12){
                    ca.set(Calendar.YEAR,year+1);
                    ca.set(Calendar.MONTH,0);
                }else {
                    ca.set(Calendar.MONTH,month);
                }
                ca.set(Calendar.DAY_OF_MONTH,10);
                date = ca.getTime();
                order.setDueTime(date);
            }
            //生成订单编号
            String orderId = UUID.randomUUID().toString().replace("-", "");
            order.setOrderId(orderId);
            int i = ordersMapper.insert(order);

            //3.生成商品快照
            for (ShoppingCartVO sc: list) {
                int cnum = Integer.parseInt(sc.getCartNum());
                String itemId = System.currentTimeMillis()+""+ (new Random().nextInt(89999)+10000);
                OrderItem orderItem = new OrderItem(itemId, orderId, sc.getProductId(), sc.getProductName(), sc.getProductImg(), sc.getSkuId(), sc.getSkuName(), new BigDecimal(sc.getSellPrice()), cnum, new BigDecimal(sc.getSellPrice() * cnum), new Date(), new Date(), 0);
                orderItemMapper.insert(orderItem);
                //增加商品销量
            }

            //4.扣减库存：根据套餐ID修改套餐库存量
            for (ShoppingCartVO sc: list) {
                String skuId = sc.getSkuId();
                int newStock = sc.getSkuStock()- Integer.parseInt(sc.getCartNum());

                ProductSku productSku = new ProductSku();
                productSku.setSkuId(skuId);
                productSku.setStock(newStock);
                productSkuMapper.updateByPrimaryKeySelective(productSku);
            }

            //5.删除购物车：当购物车中的记录购买成功之后，购物车中对应做删除操作
            for (int cid: cidsList) {
                shoppingCartMapper.deleteByPrimaryKey(cid);
            }
            logger.info("add order finished...");
            map.put("orderId",orderId);
            map.put("productNames",untitled);
            return map;
        }else{
            //表示库存不足
            return null;
        }
    }

    @Override
    public int updateOrderStatus(String orderId, String status) {
        Orders orders = new Orders();
        orders.setOrderId(orderId);
        orders.setStatus(status);
        int i = ordersMapper.updateByPrimaryKeySelective(orders);
        return i;
    }

    @Override
    public ResultVO getOrderById(String orderId) {
        Orders order = ordersMapper.selectByPrimaryKey(orderId);
        return new ResultVO(ResStatus.OK,"sucesss",order.getStatus());
    }

    @Override
    @Transactional(isolation = Isolation.SERIALIZABLE)
    public ResultVO closeOrder(String orderId) {
        synchronized (this) {
            //  1.修改当前订单：status=6 已关闭  close_type=1 超时未支付
            Orders cancleOrder = new Orders();
            cancleOrder.setOrderId(orderId);
            cancleOrder.setStatus("6");  //已关闭
            Orders orders = ordersMapper.selectByPrimaryKey(orderId);
            if(orders.getStatus()=="1"){
                cancleOrder.setCloseType(1); //关闭类型：超时未支付
            }else {
                cancleOrder.setCloseType(4); //关闭类型：超时未支付
            }
            Date date = new Date();
            cancleOrder.setCancelTime(date);
            int i = ordersMapper.updateByPrimaryKeySelective(cancleOrder);
            if(i == 0){
                return new ResultVO(ResStatus.NO,"FAILED","");
            }
            //  2.还原库存：先根据当前订单编号查询商品快照（skuid  buy_count）--->修改product_sku
            Example example1 = new Example(OrderItem.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andEqualTo("orderId", orderId);
            List<OrderItem> orderItems = orderItemMapper.selectByExample(example1);
            //还原库存
            for (int j = 0; j < orderItems.size(); j++) {
                OrderItem orderItem = orderItems.get(j);
                //修改
                ProductSku productSku = productSkuMapper.selectByPrimaryKey(orderItem.getSkuId());
                productSku.setStock(productSku.getStock() + orderItem.getBuyCounts());
                productSkuMapper.updateByPrimaryKey(productSku);
            }
            return new ResultVO(ResStatus.OK,"SUCCESS","");
        }
    }

    @Override
    public ResultVO listOrders(String userId, String status, int pageNum, int limit) {
        //1.分页查询
        int start = (pageNum-1)*limit;
        List<OrdersVO> ordersVOS = ordersMapper.selectOrders(userId, status, start, limit);

        //2.查询总记录数
        Example example = new Example(Orders.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("userId",userId);
        if(status != null && !"".equals(status)){
            criteria.andLike("status",status);
        }
        criteria.andNotEqualTo("deleteStatus",1);
        int count = ordersMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count%limit==0?count/limit:count/limit+1;

        //4.封装数据
        PageHelper<OrdersVO> pageHelper = new PageHelper<>(count, pageCount, ordersVOS);;
        return new ResultVO(ResStatus.OK,"SUCCESS",pageHelper);
    }


    public ResultVO listAreas(){
        List<AreaVo> areaVos = areaMapper.selectFirstLevelAreas();
        ResultVO resultVO = new ResultVO(ResStatus.OK, "success", areaVos);
        return resultVO;
    }

    @Override
    public ResultVO getAreaById(Integer pid) {
        List<AreaVo> areaVos = areaMapper.selectAllAreas2(pid);
        ResultVO resultVO = new ResultVO(ResStatus.OK, "success", areaVos);
        return resultVO;
    }

    @Override
    public ResultVO deleteOrder(String orderId) {
        Orders orders = new Orders();
        orders.setOrderId(orderId);
        orders.setDeleteStatus(1);
        int i = ordersMapper.updateByPrimaryKeySelective(orders);
        if(i==1){
            return new ResultVO(ResStatus.OK,"sucesss","");
        }
        return new ResultVO(ResStatus.NO,"FAILED","");
    }

    @Override
    public ResultVO confirmReceipt(String orderId) {
        Orders orders = new Orders();
        orders.setOrderId(orderId);
        orders.setStatus("4");
        int i = ordersMapper.updateByPrimaryKeySelective(orders);
        if(i==1){
            return new ResultVO(ResStatus.OK,"sucesss","");
        }
        return new ResultVO(ResStatus.NO,"FAILED","");

    }

    @Override
    public ResultVO changeTime(String orderId, Orders orders) {
        Orders order = ordersMapper.selectByPrimaryKey(orderId);
        order.setDueTime(orders.getDueTime());
        int i = ordersMapper.updateByPrimaryKeySelective(order);
        if(i==1){
            return new ResultVO(ResStatus.OK,"sucesss","");
        }
        return new ResultVO(ResStatus.NO,"FAILED","");
    }


}
