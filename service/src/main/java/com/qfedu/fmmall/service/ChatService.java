package com.qfedu.fmmall.service;

import com.qfedu.fmmall.entity.ChatMsg;
import com.qfedu.fmmall.vo.ResultVO;

public interface ChatService {
    public ResultVO addNewMsg(ChatMsg chatMsg);

    public ResultVO delUserByUserId(String receiverId);

    public void sendOne(ChatMsg data);

    public ResultVO userListDev(String userId);

    public ResultVO msgRead(ChatMsg data);

    public ResultVO msgHistory(ChatMsg receiverId);

    public ResultVO LastMsg(String receiverId);
}
