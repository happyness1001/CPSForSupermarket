package com.qfedu.fmmall.service.impl;

import com.qfedu.fmmall.dao.*;
import com.qfedu.fmmall.entity.*;
import com.qfedu.fmmall.service.ChatService;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;
import javax.annotation.Resource;
import javax.websocket.Session;
import java.io.File;
import java.io.IOException;
import java.util.*;

import org.apache.commons.io.FileUtils;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatMsgMapper chatMsgMapper;

    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private FriendListMapper friendListMapper;


    @Override
    public ResultVO addNewMsg(ChatMsg chatMsg) {
        //判断聊天双方是否为好友关系
        chatMsg.setCreatTime(new Date());
        Example example = new Example(FriendList.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",chatMsg.getSendId());
        criteria.andEqualTo("friendId",chatMsg.getReceiveId());
        List<FriendList> friendLists = friendListMapper.selectByExample(example);
        if(friendLists.size()==0){
            FriendList friendList = new FriendList();
            friendList.setUserId(chatMsg.getSendId());
            friendList.setFriendId(chatMsg.getReceiveId());
            friendList.setDeleteStatus('1');
            friendList.setOnlineStatus('0');
            friendListMapper.insert(friendList);
            friendList.setFriendId(chatMsg.getSendId());
            friendList.setUserId(chatMsg.getReceiveId());
            friendListMapper.insert(friendList);
        }
        if(!chatMsg.getContent().contains("你的好友已")){
            int t = chatMsgMapper.insert(chatMsg);
            if(t > 0){
                return new ResultVO(ResStatus.OK,"success",null);
            }else{
                return new ResultVO(ResStatus.NO,"fail",null);
            }
        }
        return new ResultVO(ResStatus.OK,"success",null);
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
        Example example = new Example(FriendList.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",userId);
        List<FriendList> friendLists = friendListMapper.selectByExample(example);
        List<Users> users = new ArrayList<>();
        List<UsersMsgVo> usersMsgVos = new ArrayList<>();
        for(FriendList friendList :friendLists){
            Users users1 = usersMapper.selectByPrimaryKey(friendList.getFriendId());
            UsersMsgVo usersMsgVo = new UsersMsgVo(users1);
            Example example2 = new Example(ChatMsg.class);
            Example.Criteria criteria2 = example2.createCriteria();
            criteria2.andEqualTo("receiveId",userId);
            criteria2.andEqualTo("sendId",users1.getUserId());
            criteria2.andEqualTo("readstate","0");
            List<ChatMsg> chatMsgList2 = chatMsgMapper.selectByExample(example2);
            usersMsgVo.setChatMsg(chatMsgMapper.lastMsg(userId,users1.getUserId()));
            usersMsgVo.setUnreadNumber(chatMsgList2.size());
            usersMsgVo.setStatus(friendList.getOnlineStatus());
            usersMsgVos.add(usersMsgVo);
        }
        return new ResultVO(ResStatus.OK,"success",usersMsgVos);
    }



//    @Override
//    public ResultVO userListDev(String userId) {
//        Example example = new Example(ChatMsg.class);
//        Example.Criteria criteria = example.createCriteria();
//        criteria.andEqualTo("sendId",userId);
//        criteria.orEqualTo("receiveId",userId);
//        List<Users> users = new ArrayList<>();
//        List<String> userIds = new ArrayList<>();
//        List<UsersMsgVo> usersMsgVos = new ArrayList<>();
//        userIds.add(userId);
//        List<ChatMsg> chatMsgList = chatMsgMapper.selectByExample(example);
//        for(ChatMsg chatMsg : chatMsgList){
//            if(!userIds.contains(chatMsg.getReceiveId())){
//                userIds.add(chatMsg.getReceiveId());
//                users.add(usersMapper.selectByPrimaryKey(chatMsg.getReceiveId()));
//            }
//            if(!userIds.contains(chatMsg.getSendId())){
//                userIds.add(chatMsg.getSendId());
//                users.add(usersMapper.selectByPrimaryKey(chatMsg.getSendId()));
//            }
//        }
//        for(Users users1 : users){
//            UsersMsgVo usersMsgVo = new UsersMsgVo(users1);
//            Example example2 = new Example(ChatMsg.class);
//            Example.Criteria criteria2 = example2.createCriteria();
//            criteria2.andEqualTo("receiveId",userId);
//            criteria2.andEqualTo("sendId",users1.getUserId());
//            criteria2.andEqualTo("readstate","0");
//            List<ChatMsg> chatMsgList2 = chatMsgMapper.selectByExample(example2);
//            usersMsgVo.setChatMsg(chatMsgMapper.lastMsg(userId,users1.getUserId()));
//            usersMsgVo.setUnreadNumber(chatMsgList2.size());
//            usersMsgVo.setStatus('1');
//            usersMsgVos.add(usersMsgVo);
//        }
//        return new ResultVO(ResStatus.OK,"success",usersMsgVos);
//    }

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


    @Override
    public ResultVO getUserByDetail(String information) {
        Example example = new Example(Users.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.orLike("userId", "%"+information+"%");
        criteria.orLike("username","%"+information+"%");
        criteria.orLike("nickname","%"+information+"%");
        List<Users> users = usersMapper.selectByExample(example);
        List<UsersMsgVo> usersMsgVos = new ArrayList<>();
        for(Users users1:users){
            UsersMsgVo usersMsgVo = new UsersMsgVo(users1);
            ChatMsg chatMsg = new ChatMsg();
            chatMsg.setContent("");
            chatMsg.setCreatTime(new Date());
            usersMsgVo.setChatMsg(chatMsg);
            usersMsgVos.add(usersMsgVo);
        }
        return new ResultVO(ResStatus.OK,"sucesss",usersMsgVos);
    }

    @Override
    public ResultVO getUnreadMsg(String userId) {
        Example example = new Example(ChatMsg.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("receiveId",userId);
        criteria.andEqualTo("readstate","0");
        List<ChatMsg> chatMsgList = chatMsgMapper.selectByExample(example);
        return new ResultVO(ResStatus.OK,"success",chatMsgList);
    }

    @Override
    public String saveOrUpdateImageFile(MultipartFile image){
        String path ="D:\\Users\\ASUS\\Desktop\\CPSForSupermarket\\fmall-static\\static\\chatImg";
        String suffix = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
        suffix = suffix.toLowerCase();
        if(suffix.equals(".jpg") || suffix.equals(".jpeg") || suffix.equals(".png") || suffix.equals(".gif")){
            String name = String.valueOf(UUID.randomUUID());
            String fileName = name+suffix;
            File targetFile = new File(path, fileName);
            if(!targetFile.getParentFile().exists()){    //注意，判断父级路径是否存在
                targetFile.getParentFile().mkdirs();
            }
            long size = 0;
            //保存
            try {
//                image.transferTo(targetFile);
                FileUtils.copyInputStreamToFile(image.getInputStream(), targetFile);
                size = image.getSize();
            } catch (Exception e) {
                e.printStackTrace();
            }
                return fileName;
        }else{
            return "";
        }

    }

    @Override
    public ResultVO cpsImageFile(MultipartFile image,String fileName) {
        String path ="D:\\Users\\ASUS\\Desktop\\cps\\cps-admin\\src\\main\\resources\\static\\chatImg";
        String suffix = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
        suffix = suffix.toLowerCase();
        if(suffix.equals(".jpg") || suffix.equals(".jpeg") || suffix.equals(".png") || suffix.equals(".gif")){
            File targetFile = new File(path, fileName);

            if(!targetFile.getParentFile().exists()){    //注意，判断父级路径是否存在
                targetFile.getParentFile().mkdirs();
            }
            long size = 0;
            //保存
            try {
                FileUtils.copyInputStreamToFile(image.getInputStream(), targetFile);
                String path2 ="D:\\Users\\ASUS\\Desktop\\cps\\cps-admin\\target\\classes\\static\\chatImg";
                size = image.getSize();
                File targetFile2 = new File(path2, fileName);

                if(!targetFile2.getParentFile().exists()){    //注意，判断父级路径是否存在
                    targetFile2.getParentFile().mkdirs();
                }
                FileUtils.copyInputStreamToFile(image.getInputStream(), targetFile2);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return new ResultVO(ResStatus.OK,"sucesss",fileName);
        }else{
            return new ResultVO(ResStatus.NO,"图片格式错误","");
        }

    }

    @Override
    public void getOnlineStatus(String userId,char a) {
        Example example = new Example(FriendList.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("friendId",userId);
        List<FriendList> friendLists = friendListMapper.selectByExample(example);
        for(FriendList friendList : friendLists){
            friendList.setOnlineStatus(a);
            friendListMapper.updateByPrimaryKey(friendList);
        }
    }

    @Override
    public List<String> getFriendList(String nickname) {
        Example example = new Example(FriendList.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("friendId",nickname);
        criteria.andEqualTo("deleteStatus",'1');
        List<FriendList> friendLists = friendListMapper.selectByExample(example);
        List<String> userId = new ArrayList<>();
        for(FriendList friendList : friendLists){
            userId.add(friendList.getUserId());
        }
        return userId;
    }


}
