package com.qfedu.fmmall.service.impl;

import com.qfedu.fmmall.dao.*;
import com.qfedu.fmmall.entity.*;
import com.qfedu.fmmall.service.ChatService;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatMsgMapper chatMsgMapper;

    @Autowired
    private UsersMapper usersMapper;


    @Override
    public ResultVO addNewMsg(ChatMsg chatMsg) {
        chatMsg.setCreatTime(new Date());
        int t = chatMsgMapper.insert(chatMsg);
        if(t > 0){
            return new ResultVO(ResStatus.OK,"success",null);
        }else{
            return new ResultVO(ResStatus.NO,"fail",null);
        }
    }

    @Override
    public ResultVO delUserByUserId(String receiverId) {
        return null;
    }

    @Override
    public void sendOne(ChatMsg data) {

    }

    @Override
    public ResultVO userListDev(String userId) {
        Example example = new Example(ChatMsg.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("sendId",userId);
        criteria.orEqualTo("receiveId",userId);
        List<Users> users = new ArrayList<>();
        List<String> userIds = new ArrayList<>();
        List<UsersMsgVo> usersMsgVos = new ArrayList<>();
        userIds.add(userId);
        List<ChatMsg> chatMsgList = chatMsgMapper.selectByExample(example);
        for(ChatMsg chatMsg : chatMsgList){
            if(!userIds.contains(chatMsg.getReceiveId())){
                userIds.add(chatMsg.getReceiveId());
                users.add(usersMapper.selectByPrimaryKey(chatMsg.getReceiveId()));
            }
            if(!userIds.contains(chatMsg.getSendId())){
                userIds.add(chatMsg.getSendId());
                users.add(usersMapper.selectByPrimaryKey(chatMsg.getSendId()));
            }
        }
        for(Users users1 : users){
            UsersMsgVo usersMsgVo = new UsersMsgVo(users1);
            usersMsgVo.setChatMsg(chatMsgMapper.lastMsg(userId,users1.getUserId()));
            usersMsgVos.add(usersMsgVo);
        }
        return new ResultVO(ResStatus.OK,"success",usersMsgVos);
    }

    @Override
    public ResultVO msgRead(ChatMsg data) {
        Example example = new Example(ChatMsg.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("sendId",data.getSendId());
        criteria.andEqualTo("receiveId",data.getReceiveId());
        criteria.andEqualTo("readstate","0");
        List<ChatMsg> chatMsgList = chatMsgMapper.selectByExample(example);
        for(ChatMsg chatMsg : chatMsgList){
            chatMsg.setReadstate("1");
            chatMsgMapper.updateByPrimaryKey(chatMsg);
        }
        return new ResultVO(ResStatus.OK,"success",null);
    }

    @Override
    public ResultVO msgHistory(ChatMsg data) {
        List<ChatMsg> chatMsgList = chatMsgMapper.selectHistoryMsg(data.getSendId(),data.getReceiveId());
        return new ResultVO(ResStatus.OK,"success",chatMsgList);
    }

    @Override
    public ResultVO LastMsg(String receiverId) {
        Example example = new Example(ChatMsg.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("receiveId",receiverId);
        criteria.andEqualTo("readstate","1");
        List<ChatMsg> chatMsgList = chatMsgMapper.selectByExample(example);
        return new ResultVO(ResStatus.OK,"success",chatMsgList);
    }


}
