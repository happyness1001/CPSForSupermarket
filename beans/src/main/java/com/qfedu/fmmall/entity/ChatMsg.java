package com.qfedu.fmmall.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "chat_msg")
public class ChatMsg {
    /**
     * 消息ID
     */
    @Id
    @Column(name = "msg_id")
    private Long msgId;

    /**
     * 消息内容
     */
    private String content;

    /**
     * 发送者ID
     */
    @Column(name = "send_id")
    private String sendId;

    /**
     * 接收者ID
     */
    @Column(name = "receive_id")
    private String receiveId;

    /**
     * 发送时间
     */
    @Column(name = "creat_time")
    private Date creatTime;

    /**
     * 查看状态 0未看 1已看
     */
    @Column(name = "readState")
    private String readstate;

    /**
     * 获取消息ID
     *
     * @return msg_id - 消息ID
     */
    public Long getMsgId() {
        return msgId;
    }

    /**
     * 设置消息ID
     *
     * @param msgId 消息ID
     */
    public void setMsgId(Long msgId) {
        this.msgId = msgId;
    }

    /**
     * 获取消息内容
     *
     * @return content - 消息内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置消息内容
     *
     * @param content 消息内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取发送者ID
     *
     * @return send_id - 发送者ID
     */
    public String getSendId() {
        return sendId;
    }

    /**
     * 设置发送者ID
     *
     * @param sendId 发送者ID
     */
    public void setSendId(String sendId) {
        this.sendId = sendId;
    }

    /**
     * 获取接收者ID
     *
     * @return receive_id - 接收者ID
     */
    public String getReceiveId() {
        return receiveId;
    }

    /**
     * 设置接收者ID
     *
     * @param receiveId 接收者ID
     */
    public void setReceiveId(String receiveId) {
        this.receiveId = receiveId;
    }

    /**
     * 获取发送时间
     *
     * @return creat_time - 发送时间
     */
    public Date getCreatTime() {
        return creatTime;
    }

    /**
     * 设置发送时间
     *
     * @param creatTime 发送时间
     */
    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    /**
     * 获取查看状态 0未看 1已看
     *
     * @return readState - 查看状态 0未看 1已看
     */
    public String getReadstate() {
        return readstate;
    }

    /**
     * 设置查看状态 0未看 1已看
     *
     * @param readstate 查看状态 0未看 1已看
     */
    public void setReadstate(String readstate) {
        this.readstate = readstate;
    }
}