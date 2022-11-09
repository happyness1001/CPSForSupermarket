package com.qfedu.fmmall.service;

import com.qfedu.fmmall.entity.ChatMsg;
import com.qfedu.fmmall.vo.ResultVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ChatService {
    public ResultVO addNewMsg(ChatMsg chatMsg);

    public ResultVO delUserByUserId(String receiverId);

    public void sendOne(ChatMsg data);

    public ResultVO userListDev(String userId);

    public ResultVO msgRead(ChatMsg data);

    public ResultVO msgHistory(ChatMsg receiverId);

    public ResultVO LastMsg(String receiverId);

    public ResultVO getUserByDetail(String information);

    public ResultVO getUnreadMsg(String userId);

    public String saveOrUpdateImageFile(MultipartFile image);

    public ResultVO cpsImageFile(MultipartFile image,String fileName);

    public void getOnlineStatus(String nickname, char a);

    public List<String> getFriendList(String nickname);

    public String assignServices(String nickname);

    public ResultVO getCustomer(String userId);

    public ResultVO addCustomerMsg(ChatMsg chatMsg);

    public void removeFriend(String nickname);

    public ResultVO userRelationDev(String userId);
}
