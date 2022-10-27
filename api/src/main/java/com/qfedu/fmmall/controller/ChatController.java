package com.qfedu.fmmall.controller;

import com.qfedu.fmmall.entity.ChatMsg;
import com.qfedu.fmmall.service.ChatService;
import com.qfedu.fmmall.service.ProductCommontsService;
import com.qfedu.fmmall.service.ProductService;
import com.qfedu.fmmall.vo.ResultVO;
import com.qfedu.fmmall.websocket.MyWebSocket;
import com.qfedu.fmmall.websocket.WebSocketServer;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;

@RestController
@CrossOrigin
@RequestMapping("/chat")
@Api(value = "聊天信息相关的接口",tags = "聊天信息")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Resource
    private MyWebSocket webSocket;

    /**
     * @description: 消息记录
     */
    @PostMapping("/msgHistory")
    public ResultVO msgHistory(@RequestBody ChatMsg data) throws IOException {
        return  chatService.msgHistory(data);
    }

    /**
     * @description: 消息已读
     */
    @PostMapping("/msgRead")
    private ResultVO msgRead(@RequestBody ChatMsg data) throws IOException {
        return  chatService.msgRead(data);
    }

    /**
     * @description: 全体发送
     * @author: lvyq
     */
    @GetMapping("/sendAll/{msg}")
    public void sendAll(@PathVariable("msg") String msg) throws IOException {
        webSocket.broadcast(msg);
    }

    /**
     * @description: 发消息给某人
     */
    @PostMapping("/sendOne")
    public void sendOne(@RequestBody ChatMsg data) throws IOException {
        chatService.sendOne(data);
    }

    /**
     * @description: 获取用户列表
     */

    @GetMapping("/userList/{userId}")
    private ResultVO userList(@PathVariable("userId") String userId){

        return chatService.userListDev(userId);
    }

    /**
     * @description: 根据userId删除用户
     */
    @PostMapping("/delUserByUserId")
    public ResultVO delUserByUserId(@PathVariable("userId") String userId){
        return chatService.delUserByUserId(userId);
    }

    @ApiOperation("查询是否有未读信息接口")
    @GetMapping("/getUnreadMsg/{userId}")
    public ResultVO getUnreadMsg(@PathVariable("userId") String userId){
        ResultVO resultVO = chatService.getUnreadMsg(userId);
        return resultVO;
    }

    @ApiOperation("传输图片接口")
//    @Transactional
    @PutMapping("/sendImg")
    public ResultVO sendImg( @RequestBody MultipartFile image) throws IOException {
        String name = chatService.saveOrUpdateImageFile(image);
        ResultVO resultVO = chatService.cpsImageFile(image,name);
        return resultVO;
    }

//    @ApiOperation("传输图片接口")
////    @Transactional
//    @PutMapping("/cpsImg")
//    public ResultVO cspImg( @RequestBody MultipartFile image) throws IOException {
//        ResultVO resultVO = chatService.cpsImageFile(image);
//        return resultVO;
//    }





}

