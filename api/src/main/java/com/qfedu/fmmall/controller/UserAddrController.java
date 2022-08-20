package com.qfedu.fmmall.controller;

import com.qfedu.fmmall.entity.UserAddr;
import com.qfedu.fmmall.entity.Users;
import com.qfedu.fmmall.service.UserAddrService;
import com.qfedu.fmmall.vo.ResultVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@Api(value = "提供收货地址相关接口",tags = "收货地址管理")
@RequestMapping("/useraddr")
public class UserAddrController {

    @Autowired
    private UserAddrService userAddrService;

    @GetMapping("/list")
    @ApiImplicitParam(dataType = "int",name = "userId", value = "用户ID",required = true)
    public ResultVO listAddr(Integer userId, @RequestHeader("token") String token){
        ResultVO resultVO = userAddrService.listAddrsByUid(userId);
        return resultVO;
    }

    @ApiOperation("新增地址接口")
    @PostMapping("/add-address")
    public ResultVO addNewAddress(@RequestHeader("token") String token,@RequestBody UserAddr userAddr){
        ResultVO resultVO = userAddrService.addNewAddress(userAddr);
        return resultVO;
    }


}
