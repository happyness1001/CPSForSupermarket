package com.qfedu.fmmall.controller;

import com.qfedu.fmmall.entity.Users;
import com.qfedu.fmmall.service.UserService;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;

@RestController
@RequestMapping("/user")
@Api(value = "提供用户的登录和注册接口",tags = "用户管理")
@CrossOrigin
public class UserController {

    @Resource
    private UserService userService;


    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @ApiOperation("用户登录接口")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "username", value = "用户登录账号",required = true),
            @ApiImplicitParam(dataType = "string",name = "password", value = "用户登录密码",required = true)
    })
    @GetMapping("/login")
    public ResultVO login(@RequestParam("username") String name,
                          @RequestParam(value = "password") String pwd){
        ResultVO resultVO = userService.checkLogin(name, pwd);
        logger.info(resultVO.getMsg());
        return resultVO;
    }



    @ApiOperation("用户注册接口")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "username", value = "用户注册账号",required = true),
            @ApiImplicitParam(dataType = "string",name = "password", value = "用户注册密码",required = true)
    })
    @PostMapping("/regist")
    public ResultVO regist(@RequestBody Users user){
        ResultVO resultVO = userService.userResgit(user.getUsername(), user.getPassword());
        return resultVO;
    }

    @ApiOperation("校验token是否过期接口")
    @GetMapping("/check")
    public ResultVO userTokencheck(@RequestHeader("token") String token){
        return new ResultVO(ResStatus.OK,"success",null);
    }

    @ApiOperation("修改个人信息接口")
    @PutMapping("/updateUser")
    public ResultVO updateUser(@RequestHeader("token") String token,@RequestBody Users user){
        ResultVO resultVO = userService.updateUser(user);
        return resultVO;
    }

    @ApiOperation("更换头像接口")
//    @Transactional
    @PutMapping("/changeAvatar/{id}")
    public ResultVO update(@RequestHeader("token") @PathVariable("id") String id, @RequestBody MultipartFile image) throws IOException {
        ResultVO resultVO = userService.saveOrUpdateImageFile(id, image);
        return resultVO;
    }


    @ApiOperation("查询用户信息接口")
    @GetMapping("/getUser/{userId}")
    public ResultVO getUser(@RequestHeader("token") String token,@PathVariable("userId") String userId){
        ResultVO resultVO = userService.getUserById(userId);
        return resultVO;
    }

    @ApiOperation("查询评论信息接口")
    @GetMapping("/getComment/{userId}")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "当前页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页显示条数",required = true)
    })
    public ResultVO getComment(@RequestHeader("token") String token,@PathVariable("userId") String userId,int pageNum,int limit){
        ResultVO resultVO = userService.getCommentById(userId,pageNum,limit);
        return resultVO;
    }

    @ApiOperation("查询用户历史购买记录接口")
    @GetMapping("/getUserHistory/{userId}")
    public ResultVO getHistoryProduct(@RequestHeader("token") String token,@PathVariable("userId") String userId){
        ResultVO resultVO = userService.getHistoryProduct(userId);
        return resultVO;
    }

    @ApiOperation("对账查询接口")
    @GetMapping("/reconciliation/{userId}")
    public ResultVO getreconciliation(@RequestHeader("token") String token,@PathVariable("userId") String userId){
        ResultVO resultVO = userService.getReconciliation(userId);
        return resultVO;
    }

    @ApiOperation("查询用户接口")
    @GetMapping("/getUserByDetail/{information}")
    public ResultVO getUserByDetail(@RequestHeader("token") String token,@PathVariable("information") String information){
        ResultVO resultVO = userService.getUserByDetail(information);
        return resultVO;
    }

}
