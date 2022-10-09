package com.qfedu.fmmall.dao;

import com.qfedu.fmmall.entity.ChatMsg;
import com.qfedu.fmmall.entity.ProductVO;
import com.qfedu.fmmall.general.GeneralDAO;

import java.util.List;

public interface ChatMsgMapper extends GeneralDAO<ChatMsg> {
    public List<ChatMsg> selectHistoryMsg(String sendId,String receiveId);

    public ChatMsg lastMsg(String sendId,String receiveId);
}