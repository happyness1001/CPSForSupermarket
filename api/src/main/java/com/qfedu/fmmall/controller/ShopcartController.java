package com.qfedu.fmmall.controller;

import com.qfedu.fmmall.entity.ShoppingCart;
import com.qfedu.fmmall.service.ShoppingCartService;
import com.qfedu.fmmall.utils.Base64Utils;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import io.jsonwebtoken.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/shopcart")
@CrossOrigin
@Api(value = "提供购物车业务相关接口",tags = "购物车管理")
public class ShopcartController {

    @Autowired
    private ShoppingCartService shoppingCartService;

    @PostMapping("/add")
    public ResultVO addShoppingCart(@RequestBody ShoppingCart cart,@RequestHeader("token")String token){
        ResultVO resultVO = shoppingCartService.addShoppingCart(cart);
        return resultVO;
    }

    @GetMapping("/list")
    @ApiImplicitParam(dataType = "int",name = "userId", value = "用户ID",required = true)
    public ResultVO list(Integer userId,@RequestHeader("token")String token){
        ResultVO resultVO = shoppingCartService.listShoppingCartsByUserId(userId);
        return resultVO;
    }

    @PutMapping("/update/{cid}/{cnum}")
    public ResultVO updateNum(@PathVariable("cid") Integer cartId,
                              @PathVariable("cnum") Integer cartNum,
                                @RequestHeader("token") String token){
        ResultVO resultVO = shoppingCartService.updateCartNum(cartId, cartNum);
        return resultVO;
    }

    @GetMapping("/listbycids")
    @ApiImplicitParam(dataType = "String",name = "cids", value = "选择的购物车记录的id",required = true)
    public ResultVO listByCids(String cids, @RequestHeader("token")String token){
        ResultVO resultVO = shoppingCartService.listShoppingCartsByCids(cids);
        return resultVO;
    }

    @ApiOperation("删除购物车接口")
    @DeleteMapping("/deleteCart")
    public ResultVO deleteAddress(@RequestHeader("token") String token,@RequestParam Integer cartId){
        ResultVO resultVO = shoppingCartService.deleteShoppingCart(cartId);
        return resultVO;
    }

    @GetMapping("/listNewCarts")
    public ResultVO listNewCarts(@RequestParam String userId,@RequestParam Integer num, @RequestHeader("token")String token){
        ResultVO resultVO = new ResultVO(ResStatus.OK, "success", shoppingCartService.getLastestCart(userId,num));
        return resultVO;
    }



}
