package com.qfedu.fmmall.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.Column;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

public class Reconciliation {
    /**
     * 交易id
     */
    @Id
    @Column(name = "record_id")
    private String recordId;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 用于对账的订单id 或者合同id
     */
    @Column(name = "order_id")
    private String orderId;

    /**
     * 订单或合同内容
     */
    @Column(name = "order_content")
    private String orderContent;

    /**
     * 订单或合同应付金额
     */
    @Column(name = "amounts_payable")
    private BigDecimal amountsPayable;

    /**
     * 已付金额
     */
    @Column(name = "amount_paid")
    private BigDecimal amountPaid;

    /**
     * 订单或合同生成时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 最后支付时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Column(name = "final_payment")
    private Date finalPayment;

    /**
     * 款项是否结清
     */

    @Column(name = "is_finished")
    private String isFinished;

    /**
     * 交割时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Column(name = "due_time")
    private Date dueTime;

    /**
     * 获取交易id
     *
     * @return record_id - 交易id
     */
    public String getRecordId() {
        return recordId;
    }

    /**
     * 设置交易id
     *
     * @param recordId 交易id
     */
    public void setRecordId(String recordId) {
        this.recordId = recordId;
    }

    /**
     * 获取用户id
     *
     * @return user_id - 用户id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 设置用户id
     *
     * @param userId 用户id
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 获取用于对账的订单id 或者合同id
     *
     * @return order_id - 用于对账的订单id 或者合同id
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * 设置用于对账的订单id 或者合同id
     *
     * @param orderId 用于对账的订单id 或者合同id
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * 获取订单或合同内容
     *
     * @return order_content - 订单或合同内容
     */
    public String getOrderContent() {
        return orderContent;
    }

    /**
     * 设置订单或合同内容
     *
     * @param orderContent 订单或合同内容
     */
    public void setOrderContent(String orderContent) {
        this.orderContent = orderContent;
    }

    /**
     * 获取订单或合同应付金额
     *
     * @return amounts_payable - 订单或合同应付金额
     */
    public BigDecimal getAmountsPayable() {
        return amountsPayable;
    }

    /**
     * 设置订单或合同应付金额
     *
     * @param amountsPayable 订单或合同应付金额
     */
    public void setAmountsPayable(BigDecimal amountsPayable) {
        this.amountsPayable = amountsPayable;
    }

    /**
     * 获取已付金额
     *
     * @return amount_paid - 已付金额
     */
    public BigDecimal getAmountPaid() {
        return amountPaid;
    }

    /**
     * 设置已付金额
     *
     * @param amountPaid 已付金额
     */
    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    /**
     * 获取订单或合同生成时间
     *
     * @return create_time - 订单或合同生成时间
     */

    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置订单或合同生成时间
     *
     * @param createTime 订单或合同生成时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取最后支付时间
     *
     * @return final_payment - 最后支付时间
     */
    public Date getFinalPayment() {
        return finalPayment;
    }

    /**
     * 设置最后支付时间
     *
     * @param finalPayment 最后支付时间
     */
    public void setFinalPayment(Date finalPayment) {
        this.finalPayment = finalPayment;
    }

    /**
     * 获取款项是否结清
     *
     * @return is_finished - 款项是否结清
     */
    public String getIsFinished() {
        return isFinished;
    }

    /**
     * 设置款项是否结清
     *
     * @param isFinished 款项是否结清
     */
    public void setIsFinished(String isFinished) {
        this.isFinished = isFinished;
    }

    /**
     * 获取交割时间
     *
     * @return due_time - 交割时间
     */
    public Date getDueTime() {
        return dueTime;
    }

    /**
     * 设置交割时间
     *
     * @param dueTime 交割时间
     */
    public void setDueTime(Date dueTime) {
        this.dueTime = dueTime;
    }
}