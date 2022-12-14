package com.qfedu.fmmall.websocket;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.qfedu.fmmall.entity.ChatMsg;
import com.qfedu.fmmall.service.ChatService;
import com.qfedu.fmmall.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.json.JsonParseException;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint(value = "/CustomerSocket/{nickname}")
@Component
public class CustomerWebSocket {

    private static ChatService chatService;
    @Autowired
    public  void setChatService(ChatService chatService) {
       CustomerWebSocket.chatService = chatService;
    }
    private String nickname;

    //用来记录sessionId和该session进行绑定
    private static Map<String,Session> map = new HashMap<String, Session>();

    //用来存放每个客户端对应的MyWebSocket对象。
    private static CopyOnWriteArraySet<CustomerWebSocket> webSocketSet = new CopyOnWriteArraySet<CustomerWebSocket>();

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    /**
     * 连接建立成功调用的方法
     */
    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session,@PathParam("nickname") String nickname) {
        if(nickname!=null&&nickname!=""){
            this.session = session;
            this.nickname=nickname;
            if(map.containsKey(nickname)){
            }else {
                map.put(nickname, session);
                webSocketSet.add(this);
//                chatService.getOnlineStatus(nickname,'1');
//                onlineRemain(nickname);
                System.out.println("有新用户:"+nickname+"请求服务；" +"当前请求客服服务人数为："+ webSocketSet.size());
//                    session.getAsyncRemote().sendText(message);
//                }
            }
        }
    }
    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        webSocketSet.remove(this);
        map.remove(nickname);//从set中删除
//        chatService.removeFriend(nickname);
        System.out.println("有一连接关闭！当前在线人数为" + webSocketSet.size());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息*/
    @OnMessage
    public void onMessage(String message, Session session,@PathParam("nickname") String nickname) {
        System.out.println("来自客户端的消息-->"+nickname+": " + message);

        //从客户端传过来的数据是json数据，所以这里使用jackson进行转换为SocketMsg对象，
        // 然后通过socketMsg的type进行判断是单聊还是群聊，进行相应的处理:
        ObjectMapper objectMapper = new ObjectMapper();
        /*SocketMsg socketMsg;*/
        ChatMsg chatMsg;

        try {
            chatMsg = objectMapper.readValue(message, ChatMsg.class);
            if(chatMsg.getReceiveId() != ""&&chatMsg.getReceiveId() !=null){
                //单聊.需要找到发送者和接受者.
                chatMsg.setSendId(nickname);//发送者.
                Session fromSession = map.get(chatMsg.getSendId());
                Session toSession = map.get(chatMsg.getReceiveId());
                //发送给接受者.
                if(toSession != null){
                    chatMsg.setReadstate("0");
                    chatService.addCustomerMsg(chatMsg);
//                    toSession.getAsyncRemote().sendText(nickname+"："+chatMsg.getContent());
                    toSession.getAsyncRemote().sendText(nickname+":"+chatMsg.getContent());
                }else{
                    //发送给发送者.
                    chatMsg.setReadstate("0");
                    chatService.addCustomerMsg(chatMsg);
                }
            }else{
                //群发消息
                broadcast(nickname+": "+chatMsg.getContent());
            }

        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 发生错误时调用
     *
     */
    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("发生错误");
        error.printStackTrace();
    }
    /**
     * 群发自定义消息
     * */
    public  void broadcast(String message){
        for (CustomerWebSocket item : webSocketSet) {
            //同步异步说明参考：http://blog.csdn.net/who_is_xiaoming/article/details/53287691
            //this.session.getBasicRemote().sendText(message);
            item.session.getAsyncRemote().sendText(message);//异步发送消息.
        }
    }

    /**
     * 好友上线提醒
     * */
    public  void onlineRemain(String message){
        List<String> users = chatService.getFriendList(message);
        for(String userId:users){
            Session toSession = map.get(userId);
            if(toSession!=null){
                toSession.getAsyncRemote().sendText(message+":"+"你的好友已上线");
            }
        }
    }

    public  void outlineRemain(String message) {
        List<String> users = chatService.getFriendList(message);
        for (String userId : users) {
            Session toSession = map.get(userId);
            if (toSession != null) {
                toSession.getAsyncRemote().sendText(message + ":" + "你的好友已离线");
            }
        }
    }

    /**
     * 发送消息，实践表明，每次浏览器刷新，session会发生变化。
     * @param session
     * @param message
     */
    public static void SendMessage(Session session, String message) {
        try {
            //session.getBasicRemote().sendText(String.format("%s (From Server，Session ID=%s)",message,session.getId()));
            session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 指定Session发送消息
     * @param sessionId
     * @param message
     * @throws IOException
     */
    public static void SendMessageById(String message,String sessionId) throws IOException {
        Session session = null;
        for (CustomerWebSocket s : webSocketSet) {
            if(s.session.getId().equals(sessionId)){
                session = s.session;
                break;
            }
        }
        if(session!=null){
            SendMessage(session, message);
        }
    }
    /**
     * @description: 指定发送
     */
    public static void SendMessageByRecId(String message,String receiveId) throws IOException {
        Session session=  map.get(receiveId);
        String sessionId = "";
        if (session!=null){
            sessionId=session.getId();
        }
        for (CustomerWebSocket s : webSocketSet) {
            if(s.session.getId().equals(sessionId)){
                session = s.session;
                break;
            }
        }
        if(session!=null){
            SendMessage(session, message);
        }
//        else{
//            log.warn("没有找到你指定ID的会话：{}");
//        }
    }
}

