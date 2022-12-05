package com.qfedu.fmmall.service.impl;

import com.jayway.jsonpath.internal.function.numeric.Max;
import com.qfedu.fmmall.dao.*;
import com.qfedu.fmmall.entity.*;
import com.qfedu.fmmall.service.ChatService;
import com.qfedu.fmmall.utils.MD5Utils;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
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
@Configuration
public class ChatServiceImpl implements ChatService {

    @Value(value ="${file.uploadurl}")
    private String uploadPath;

    @Value(value ="${file.ip}")
    private String ip;

    @Autowired
    private ChatMsgMapper chatMsgMapper;

    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private FriendListMapper friendListMapper;

    @Autowired
    private CpsSupermarketMapper cpsSupermarketMapper;


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
        Users users = usersMapper.selectByPrimaryKey(userId);
        Example example = new Example(FriendList.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",userId);
        List<FriendList> friendLists = friendListMapper.selectByExample(example);
        List<UsersMsgVo> usersMsgVos = new ArrayList<>();
        for(FriendList friendList :friendLists){
            Users users1 = usersMapper.selectByPrimaryKey(friendList.getFriendId());
            UsersMsgVo usersMsgVo = new UsersMsgVo(users1);
            Example example2 = new Example(ChatMsg.class);
            Example.Criteria criteria2 = example2.createCriteria();
            if(users.getRole().equals("1")){
                criteria2.andEqualTo("receiveId","0");
                criteria2.andEqualTo("sendId",users1.getUserId());
            }else{
                criteria2.andEqualTo("receiveId",userId);
                criteria2.andEqualTo("sendId",users1.getUserId());
            }
            criteria2.andEqualTo("readstate","0");
            List<ChatMsg> chatMsgList2 = chatMsgMapper.selectByExample(example2);
            if(users.getRole().equals("1")){
                if(chatMsgMapper.lastMsg("0",users1.getUserId())!=null){
                    usersMsgVo.setChatMsg(chatMsgMapper.lastMsg("0",users1.getUserId()));
                }else{
                    usersMsgVo.setChatMsg(new ChatMsg(new Date(),"尚未开始聊天"));
                }
            }else{
                if(chatMsgMapper.lastMsg(userId,users1.getUserId())!=null){
                    usersMsgVo.setChatMsg(chatMsgMapper.lastMsg(userId,users1.getUserId()));
                }else{
                    usersMsgVo.setChatMsg(new ChatMsg(new Date(),"尚未开始聊天"));
                }
            }
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
    public ResultVO saveOrUpdateImageFile(MultipartFile image){
//        String path ="D:\\Users\\ASUS\\Desktop\\CPSForSupermarket\\api\\src\\main\\resources\\templates\\static\\chatImg";
//        String path ="/var/CPSForSupermarket/api/src/main/resources/templates/static/chatImg";
        String path = uploadPath+"chatImg";
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
            return new ResultVO(ResStatus.OK,"sucesss","http://"+ip+"/cps/profile/upload/chatImg/"+fileName);
        }else{
            return new ResultVO(ResStatus.NO,"图片格式错误","");
        }

    }

//    @Override
//    public ResultVO cpsImageFile(MultipartFile image,String fileName) {
//////        String path ="D:\\Users\\ASUS\\Desktop\\CPSForSupermarket\\api\\src\\main\\resources\\templates\\static\\chatImg";
////        String path ="/var/cps/cps-admin/src/main/resources/static/chatImg";
////        String suffix = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
////        suffix = suffix.toLowerCase();
////        if(suffix.equals(".jpg") || suffix.equals(".jpeg") || suffix.equals(".png") || suffix.equals(".gif")){
////            File targetFile = new File(path, fileName);
////
////            if(!targetFile.getParentFile().exists()){    //注意，判断父级路径是否存在
////                targetFile.getParentFile().mkdirs();
////            }
////            long size = 0;
////            //保存
////            try {
////                FileUtils.copyInputStreamToFile(image.getInputStream(), targetFile);
//////                String path2 ="D:\\Users\\ASUS\\Desktop\\cps\\cps-admin\\target\\classes\\static\\chatImg";
////                String path2 ="/var/cps/cps-admin/target/classes/static/chatImg";
////                size = image.getSize();
////                File targetFile2 = new File(path2, fileName);
////
////                if(!targetFile2.getParentFile().exists()){    //注意，判断父级路径是否存在
////                    targetFile2.getParentFile().mkdirs();
////                }
////                FileUtils.copyInputStreamToFile(image.getInputStream(), targetFile2);
////            } catch (Exception e) {
////                e.printStackTrace();
////            }
//            return new ResultVO(ResStatus.OK,"sucesss",fileName);
////        }else{
////            return new ResultVO(ResStatus.NO,"图片格式错误","");
////        }
//
//    }

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

    @Override
    public String assignServices(String nickname) {
        return null;
    }


    @Override
    public ResultVO getCustomer(String userId) {
        Example example = new Example(Users.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("role","1");
        List<Users> usersList = usersMapper.selectByExample(example);
        String customer = "";
        Integer num = Integer.MAX_VALUE;
        Integer sign = 0;
        for(Users users1:usersList){
            Example example1 = new Example(FriendList.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andEqualTo("friendId",users1.getUserId());
            criteria1.andEqualTo("userId",userId);
            if(friendListMapper.selectByExample(example1).size()>0){
                sign = 1;
                customer = users1.getUserId();
            }
        }
        if(sign==0){
            for(Users users1:usersList) {
                Example example1 = new Example(FriendList.class);
                Example.Criteria criteria1 = example1.createCriteria();
                criteria1.andEqualTo("friendId", users1.getUserId());
                if (num > friendListMapper.selectByExample(example1).size()) {
                    num = friendListMapper.selectByExample(example1).size();
                    customer = users1.getUserId();
                }
            }
            if(customer!=null&&customer!=""){
                FriendList friendList = new FriendList();
                friendList.setUserId(customer);
                friendList.setFriendId(userId);
                friendList.setDeleteStatus('1');
                friendList.setOnlineStatus('1');
                friendListMapper.insert(friendList);
                friendList.setFriendId(customer);
                friendList.setUserId(userId);
                friendListMapper.insert(friendList);
            }
        }
        List<UsersMsgVo> usersMsgVos = new ArrayList<>();
        Users users1 = usersMapper.selectByPrimaryKey(customer);
        UsersMsgVo usersMsgVo = new UsersMsgVo(users1);
        Example example2 = new Example(ChatMsg.class);
        Example.Criteria criteria2 = example2.createCriteria();
        criteria2.andEqualTo("receiveId",userId);
        criteria2.andEqualTo("sendId","0");
        criteria2.andEqualTo("readstate","0");
        List<ChatMsg> chatMsgList2 = chatMsgMapper.selectByExample(example2);
        if(chatMsgMapper.lastMsg(userId,"0")!=null){
            usersMsgVo.setChatMsg(chatMsgMapper.lastMsg(userId,"0"));
        }else{
            usersMsgVo.setChatMsg(new ChatMsg(new Date(),"尚未开始聊天"));
        }
//        usersMsgVo.setChatMsg(chatMsgMapper.lastMsg(userId,"0"));
        usersMsgVo.setUnreadNumber(chatMsgList2.size());
        usersMsgVo.setStatus('1');
        usersMsgVos.add(usersMsgVo);
        return new ResultVO(ResStatus.OK,"success",usersMsgVos);
    }

//    @Override
//    public ResultVO getCustomer(String userId) {
//        Example example = new Example(Users.class);
//        Example.Criteria criteria = example.createCriteria();
//        criteria.andEqualTo("role","1");
//        List<Users> usersList = usersMapper.selectByExample(example);
//        String customer = "";
//        Integer num = Integer.MAX_VALUE;
//        for(Users users1:usersList){
//            Example example1 = new Example(FriendList.class);
//            Example.Criteria criteria1 = example1.createCriteria();
//            criteria1.andEqualTo("friendId",users1.getUserId());
//            if(num>friendListMapper.selectByExample(example1).size()){
//                num = friendListMapper.selectByExample(example1).size();
//                customer = users1.getUserId();
//            }
//        }
//        if(customer!=null&&customer!=""){
//            FriendList friendList = new FriendList();
//            friendList.setUserId(customer);
//            friendList.setFriendId(userId);
//            friendList.setDeleteStatus('1');
//            friendList.setOnlineStatus('1');
//            friendListMapper.insert(friendList);
//            friendList.setFriendId(customer);
//            friendList.setUserId(userId);
//            friendListMapper.insert(friendList);
//        }
//        List<UsersMsgVo> usersMsgVos = new ArrayList<>();
//        Users users1 = usersMapper.selectByPrimaryKey(customer);
//        UsersMsgVo usersMsgVo = new UsersMsgVo(users1);
//        Example example2 = new Example(ChatMsg.class);
//        Example.Criteria criteria2 = example2.createCriteria();
//        criteria2.andEqualTo("receiveId",userId);
//        criteria2.andEqualTo("sendId","0");
//        criteria2.andEqualTo("readstate","0");
//        List<ChatMsg> chatMsgList2 = chatMsgMapper.selectByExample(example2);
//        usersMsgVo.setChatMsg(chatMsgMapper.lastMsg(userId,"0"));
//        usersMsgVo.setUnreadNumber(chatMsgList2.size());
//        usersMsgVo.setStatus('1');
//        usersMsgVos.add(usersMsgVo);
//        return new ResultVO(ResStatus.OK,"success",usersMsgVos);
//    }

    @Override
    public ResultVO addCustomerMsg(ChatMsg chatMsg) {
        chatMsg.setCreatTime(new Date());
        Users users = usersMapper.selectByPrimaryKey(chatMsg.getSendId());
        if(users.getRole().equals("1")){
            chatMsg.setSendId("0");

        }else{
            chatMsg.setReceiveId("0");
        }
        int t = chatMsgMapper.insert(chatMsg);
        if(t > 0){
            return new ResultVO(ResStatus.OK,"success",null);
        }else{
            return new ResultVO(ResStatus.NO,"fail",null);
        }
    }

    @Override
    public void removeFriend(String nickname) {
        Example example = new Example(FriendList.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("friendId",nickname);
        List<FriendList> friendLists = friendListMapper.selectByExample(example);
        for(FriendList friendList : friendLists){
            Users users = usersMapper.selectByPrimaryKey(friendList.getUserId());
            if(users.getRole().equals("1")){
                Example example1 = new Example(FriendList.class);
                Example.Criteria criteria1 = example1.createCriteria();
                criteria1.andEqualTo("userId",nickname);
                criteria1.andEqualTo("friendId",users.getUserId());
                List<FriendList> friendLists1 = friendListMapper.selectByExample(example1);
                for(FriendList friendList2 : friendLists1){
                    friendListMapper.delete(friendList2);
                }
                friendListMapper.delete(friendList);
            }

        }
    }

    @Override
    public ResultVO userRelationDev(String userId) {
        Example example = new Example(CpsSupermarket.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("cpsId",userId);
        List<CpsSupermarket> cpsSupermarkets = cpsSupermarketMapper.selectByExample(example);
        if(cpsSupermarkets.size()>0){
            return new ResultVO(ResStatus.OK,"success",cpsSupermarkets.get(0).getUserId());
        }else {
            int num = cpsSupermarketMapper.selectCount(new CpsSupermarket());
            Users user = new Users();
            Integer id = Integer.valueOf(usersMapper.getLatestUser());
            user.setUserId(String.valueOf(id+1));
            user.setUsername(String.valueOf(new Date().getTime()));
            user.setPassword(MD5Utils.md5("admin123"));
            user.setUserImg("img/default.png");
            user.setUserRegtime(new Date());
            user.setNickname("客服"+ num +"号");
            user.setUserModtime(new Date());
            int i = usersMapper.insertUser(user);
            CpsSupermarket cpsSupermarket = new CpsSupermarket();
            cpsSupermarket.setCpsId(userId);
            if(i>0){
                cpsSupermarket.setUserId(String.valueOf(id+1));
                cpsSupermarketMapper.insert(cpsSupermarket);
                return new ResultVO(ResStatus.OK,"success",cpsSupermarket.getUserId());
            }else{
                return new ResultVO(ResStatus.NO,"fail","");
            }
        }
    }

    @Override
    public ResultVO removeFriend(ChatMsg chatMsg) {
        Example example = new Example(FriendList.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("friendId",chatMsg.getReceiveId());
        criteria.andEqualTo("userId",chatMsg.getSendId());
        List<FriendList> friendLists = friendListMapper.selectByExample(example);
        for(FriendList friendList : friendLists){
            Example example1 = new Example(FriendList.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andEqualTo("userId",chatMsg.getReceiveId());
            criteria1.andEqualTo("friendId",chatMsg.getSendId());
            List<FriendList> friendLists1 = friendListMapper.selectByExample(example1);
            for(FriendList friendList2 : friendLists1){
                friendListMapper.delete(friendList2);
            }
            friendListMapper.delete(friendList);

        }
        return new ResultVO(ResStatus.OK,"success",null);
    }


}
