package com.qfedu.fmmall.controller;

import com.github.wxpay.sdk.WXPay;
import com.qfedu.fmmall.config.MyPayConfig;
import com.qfedu.fmmall.entity.GoodsReturnApply;
import com.qfedu.fmmall.entity.Orders;
import com.qfedu.fmmall.entity.ReturnGoods;
import com.qfedu.fmmall.service.ChatService;
import com.qfedu.fmmall.service.OrderService;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("/order")
@Api(value = "提供订单相关的操作接口",tags = "订单管理")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/add")
    public ResultVO add(String cids, @RequestBody Orders order){
        ResultVO resultVO = null;
        try {
            Map<String, String> orderInfo = orderService.addOrder(cids, order);
            if(orderInfo!=null){
                String orderId = orderInfo.get("orderId");
                //设置当前订单信息
                HashMap<String,String> data = new HashMap<>();
                data.put("body",orderInfo.get("productNames"));  //商品描述
                data.put("out_trade_no",orderId);               //使用当前用户订单的编号作为当前支付交易的交易号
                data.put("fee_type","CNY");                     //支付币种
//                data.put("total_fee",order.getActualAmount()*100+"");          //支付金额
                data.put("total_fee","1");
                data.put("trade_type","NATIVE");                //交易类型
                data.put("notify_url","http://localhost:8080/pay/callback");           //设置支付完成时的回调方法接口
//                data.put("notify_url","http://47.118.45.73:8080/pay/callback");
                //发送请求，获取响应
                //微信支付：申请支付连接
                WXPay wxPay = new WXPay(new MyPayConfig());
                Map<String, String> resp = wxPay.unifiedOrder(data);
                orderInfo.put("payUrl",resp.get("code_url"));
                //orderInfo中包含：订单编号，购买的商品名称，支付链接
                resultVO = new ResultVO(ResStatus.OK,"提交订单成功！",orderInfo);
            }else{
                resultVO = new ResultVO(ResStatus.NO,"提交订单失败！",null);
            }
        } catch (SQLException e) {
            resultVO = new ResultVO(ResStatus.NO,"提交订单失败！",null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultVO;
    }

    @GetMapping("/status/{oid}")
    public ResultVO getOrderStatus(@PathVariable("oid") String orderId,@RequestHeader("token")String token){
        ResultVO resultVO = orderService.getOrderById(orderId);
        return resultVO;
    }

    @ApiOperation("取消订单接口")
    @PutMapping("/cancelOrder/{oid}")
    public ResultVO cancelOrder(@PathVariable("oid") String orderId,@RequestHeader("token")String token){
        ResultVO resultVO = orderService.closeOrder(orderId);
        return resultVO;
    }

    @ApiOperation("修改交接时间接口")
    @PutMapping("/changeTime/{oid}")
    public ResultVO changeTime(@PathVariable("oid") String orderId,@RequestHeader("token")String token, @RequestBody Orders order){
        ResultVO resultVO = orderService.changeTime(orderId,order);
        return resultVO;
    }

    @ApiOperation("确认收货状态接口")
    @PutMapping("/confirmReceipt/{oid}")
    public ResultVO updateStatus(@PathVariable("oid") String orderId ,@RequestHeader("token")String token){
        ResultVO resultVO = orderService.confirmReceipt(orderId);
        return resultVO;
    }

    @ApiOperation("删除订单接口")
    @PutMapping("/deleteOrder/{oid}")
    public ResultVO deleteOrder(@PathVariable("oid") String orderId,@RequestHeader("token")String token){
        ResultVO resultVO = orderService.deleteOrder(orderId);
        return resultVO;
    }

    @GetMapping("/list")
    @ApiOperation("订单查询接口")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "userId", value = "用户ID",required = true),
            @ApiImplicitParam(dataType = "string",name = "status", value = "订单状态",required = false),
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页条数",required = true)
    })
    public ResultVO list(@RequestHeader("token")String token,
                         String userId,String status,int pageNum,int limit){
        ResultVO resultVO = orderService.listOrders(userId, status, pageNum, limit);
        return resultVO;
    }

    @GetMapping("/area-list")
    @ApiOperation("地址查询接口")
    public ResultVO listArea(){
        return orderService.listAreas();
    }

    @GetMapping("/area/{pid}")
    @ApiOperation("根据pid查询所有子地址")
    public ResultVO getAreaById(@PathVariable("pid") Integer pid){
        ResultVO resultVO = orderService.getAreaById(pid);
        return resultVO;
    }



    @PostMapping("/payMoney")
    public ResultVO payMoney(@RequestBody Orders order){
        ResultVO resultVO = null;
        try {
            Map<String, String> orderInfo = orderService.addOrder2("cids", order);
            if(orderInfo!=null){
                String orderId = orderInfo.get("orderId");
                //设置当前订单信息
                HashMap<String,String> data = new HashMap<>();
                data.put("body",orderInfo.get("productNames"));  //商品描述
                data.put("out_trade_no",orderId);               //使用当前用户订单的编号作为当前支付交易的交易号
                data.put("fee_type","CNY");                     //支付币种
//                data.put("total_fee",order.getActualAmount()*100+"");          //支付金额
                data.put("total_fee","1");
                data.put("trade_type","NATIVE");                //交易类型
                data.put("notify_url","http://47.118.45.73:8080/pay/callback");           //设置支付完成时的回调方法接口

                //发送请求，获取响应
                //微信支付：申请支付连接
                WXPay wxPay = new WXPay(new MyPayConfig());
                Map<String, String> resp = wxPay.unifiedOrder(data);
                orderInfo.put("payUrl",resp.get("code_url"));
                //orderInfo中包含：订单编号，购买的商品名称，支付链接
                resultVO = new ResultVO(ResStatus.OK,"提交订单成功！",orderInfo);
            }else{
                resultVO = new ResultVO(ResStatus.NO,"提交订单失败！",null);
            }
        } catch (SQLException e) {
            resultVO = new ResultVO(ResStatus.NO,"提交订单失败！",null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultVO;
    }

    @PostMapping("/returnGoods")
    public ResultVO returnGoods(@RequestHeader("token")String token, @RequestBody ReturnGoods returnGoods){
        ResultVO resultVO = orderService.returnGoods(returnGoods);
        return resultVO;
    }

    @PostMapping("/returnRequest")
    public ResultVO returnRequest(@RequestHeader("token")String token, @RequestBody GoodsReturnApply goodsReturnApply){
        ResultVO resultVO = orderService.returnRequest(goodsReturnApply);
        return resultVO;
    }

    @GetMapping("/getOrder/{oid}")
    public ResultVO getOrder(@RequestHeader("token")String token, @PathVariable("oid") String oid){
        ResultVO resultVO = orderService.selectOrder(oid);
        return resultVO;
    }

    @GetMapping("/getReconciliation/{oid}")
    public ResultVO getReconciliation(@RequestHeader("token")String token, @PathVariable("oid") String oid){
        ResultVO resultVO = orderService.getReconciliation(oid);
        return resultVO;
    }

    @PutMapping("/status/{oid}")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "String",name = "status", value = "订单状态",required = true),
    })
    public ResultVO changeOrderStatus(@RequestHeader("token")String token,@PathVariable("oid") String orderId,String status){
        ResultVO resultVO = orderService.changeOrderStatus(orderId,status);
        return resultVO;
    }

    @ApiOperation("传输图片接口")
//    @Transactional
    @PutMapping("/sendImg")
    public ResultVO sendImg( @RequestBody MultipartFile image) throws IOException {
        ResultVO resultVO = orderService.saveOrUpdateImageFile(image);
        return resultVO;
    }

}
