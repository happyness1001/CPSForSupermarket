package com.qfedu.fmmall.entity;

import javax.persistence.*;

@Table(name = "cps_supermarket")
public class CpsSupermarket {
    /**
     * 关联id
     */
    @Id
    @Column(name = "relation_id")
    private Integer relationId;

    /**
     * cps用户id
     */
    @Column(name = "cps_id")
    private String cpsId;

    /**
     * 商城用户id
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 获取关联id
     *
     * @return relation_id - 关联id
     */
    public Integer getRelationId() {
        return relationId;
    }

    /**
     * 设置关联id
     *
     * @param relationId 关联id
     */
    public void setRelationId(Integer relationId) {
        this.relationId = relationId;
    }

    /**
     * 获取cps用户id
     *
     * @return cps_id - cps用户id
     */
    public String getCpsId() {
        return cpsId;
    }

    /**
     * 设置cps用户id
     *
     * @param cpsId cps用户id
     */
    public void setCpsId(String cpsId) {
        this.cpsId = cpsId;
    }

    /**
     * 获取商城用户id
     *
     * @return user_id - 商城用户id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 设置商城用户id
     *
     * @param userId 商城用户id
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
}