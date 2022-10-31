package com.qfedu.fmmall.entity;

import javax.persistence.*;

@Table(name = "friend_list")
public class FriendList {
    /**
     * 好友关系ID
     */
    @Id
    @Column(name = "list_id")
    private Integer listId;

    /**
     * 用户ID
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 好友ID
     */
    @Column(name = "friend_id")
    private String friendId;

    /**
     * 是否在线 0离线 1在线
     */
    @Column(name = "online_status")
    private char onlineStatus;

    /**
     * 删除状态 0 删除 1 显示
     */
    @Column(name = "delete_status")
    private char deleteStatus;

    /**
     * 获取好友关系ID
     *
     * @return list_id - 好友关系ID
     */
    public Integer getListId() {
        return listId;
    }

    /**
     * 设置好友关系ID
     *
     * @param listId 好友关系ID
     */
    public void setListId(Integer listId) {
        this.listId = listId;
    }

    /**
     * 获取用户ID
     *
     * @return uesr_id - 用户ID
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 设置用户ID
     *
     * @param uesrId 用户ID
     */
    public void setUserId(String uesrId) {
        this.userId = uesrId;
    }

    /**
     * 获取好友ID
     *
     * @return friend_id - 好友ID
     */
    public String getFriendId() {
        return friendId;
    }

    /**
     * 设置好友ID
     *
     * @param friendId 好友ID
     */
    public void setFriendId(String friendId) {
        this.friendId = friendId;
    }

    /**
     * 获取是否在线 0离线 1在线
     *
     * @return online_status - 是否在线 0离线 1在线
     */
    public char getOnlineStatus() {
        return onlineStatus;
    }

    /**
     * 设置是否在线 0离线 1在线
     *
     * @param onlineStatus 是否在线 0离线 1在线
     */
    public void setOnlineStatus(char onlineStatus) {
        this.onlineStatus = onlineStatus;
    }

    /**
     * 获取删除状态 0 删除 1 显示
     *
     * @return delete_status - 删除状态 0 删除 1 显示
     */
    public char getDeleteStatus() {
        return deleteStatus;
    }

    /**
     * 设置删除状态 0 删除 1 显示
     *
     * @param deleteStatus 删除状态 0 删除 1 显示
     */
    public void setDeleteStatus(char deleteStatus) {
        this.deleteStatus = deleteStatus;
    }
}