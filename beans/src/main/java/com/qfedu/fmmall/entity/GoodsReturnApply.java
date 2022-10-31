package com.qfedu.fmmall.entity;


import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "goods_return_apply")
public class GoodsReturnApply {
    /**
     * 退货id（uuid）
     */
    @Id
    @Column(name = "goods_return_apply_id")
    private String goodsReturnApplyId;

    /**
     * 订单id（uuid-64）
     */
    @Column(name = "order_id")
    private String orderId;

    /**
     * 退货类型（0仅退款，1退款退货，2换货）
     */
    @Column(name = "return_type")
    private char returnType;

    /**
     * 申请原因
     */
    @Column(name = "return_reason")
    private String returnReason;

    /**
     * 退款金额
     */
    @Column(name = "return_money_amount")
    private BigDecimal returnMoneyAmount;

    /**
     * 退货方式（1上门取件，2自行寄回）
     */
    @Column(name = "return_approach")
    private char returnApproach;

    /**
     * 补充描述
     */
    @Column(name = "additional_desp")
    private String additionalDesp;

    /**
     * 退货凭证
     */
    @Column(name = "return_evidence")
    private String returnEvidence;

    /**
     * 审核状态（0未审核，1审核通过，2未通过）
     */
    @Column(name = "audit_status")
    private char auditStatus;

    /**
     * 创建时间
     */
    @Column(name = "create_datetime")
    private Date createDatetime;

    /**
     * 获取退货id（uuid）
     *
     * @return goods_return_apply_id - 退货id（uuid）
     */
    public String getGoodsReturnApplyId() {
        return goodsReturnApplyId;
    }

    /**
     * 设置退货id（uuid）
     *
     * @param goodsReturnApplyId 退货id（uuid）
     */
    public void setGoodsReturnApplyId(String goodsReturnApplyId) {
        this.goodsReturnApplyId = goodsReturnApplyId;
    }

    /**
     * 获取订单id（uuid-64）
     *
     * @return order_id - 订单id（uuid-64）
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * 设置订单id（uuid-64）
     *
     * @param orderId 订单id（uuid-64）
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * 获取退货类型（0仅退款，1退款退货，2换货）
     *
     * @return return_type - 退货类型（0仅退款，1退款退货，2换货）
     */
    public char getReturnType() {
        return returnType;
    }

    /**
     * 设置退货类型（0仅退款，1退款退货，2换货）
     *
     * @param returnType 退货类型（0仅退款，1退款退货，2换货）
     */
    public void setReturnType(char returnType) {
        this.returnType = returnType;
    }

    /**
     * 获取申请原因
     *
     * @return return_reason - 申请原因
     */
    public String getReturnReason() {
        return returnReason;
    }

    /**
     * 设置申请原因
     *
     * @param returnReason 申请原因
     */
    public void setReturnReason(String returnReason) {
        this.returnReason = returnReason;
    }

    /**
     * 获取退款金额
     *
     * @return return_money_amount - 退款金额
     */
    public BigDecimal getReturnMoneyAmount() {
        return returnMoneyAmount;
    }

    /**
     * 设置退款金额
     *
     * @param returnMoneyAmount 退款金额
     */
    public void setReturnMoneyAmount(BigDecimal returnMoneyAmount) {
        this.returnMoneyAmount = returnMoneyAmount;
    }

    /**
     * 获取退货方式（1上门取件，2自行寄回）
     *
     * @return return_approach - 退货方式（1上门取件，2自行寄回）
     */
    public char getReturnApproach() {
        return returnApproach;
    }

    /**
     * 设置退货方式（1上门取件，2自行寄回）
     *
     * @param returnApproach 退货方式（1上门取件，2自行寄回）
     */
    public void setReturnApproach(char returnApproach) {
        this.returnApproach = returnApproach;
    }

    /**
     * 获取补充描述
     *
     * @return additional_desp - 补充描述
     */
    public String getAdditionalDesp() {
        return additionalDesp;
    }

    /**
     * 设置补充描述
     *
     * @param additionalDesp 补充描述
     */
    public void setAdditionalDesp(String additionalDesp) {
        this.additionalDesp = additionalDesp;
    }

    /**
     * 获取退货凭证
     *
     * @return return_evidence - 退货凭证
     */
    public String getReturnEvidence() {
        return returnEvidence;
    }

    /**
     * 设置退货凭证
     *
     * @param returnEvidence 退货凭证
     */
    public void setReturnEvidence(String returnEvidence) {
        this.returnEvidence = returnEvidence;
    }

    /**
     * 获取审核状态（0未审核，1审核通过，2未通过）
     *
     * @return audit_status - 审核状态（0未审核，1审核通过，2未通过）
     */
    public char getAuditStatus() {
        return auditStatus;
    }

    /**
     * 设置审核状态（0未审核，1审核通过，2未通过）
     *
     * @param auditStatus 审核状态（0未审核，1审核通过，2未通过）
     */
    public void setAuditStatus(char auditStatus) {
        this.auditStatus = auditStatus;
    }

    /**
     * 获取创建时间
     *
     * @return create_datetime - 创建时间
     */
    public Date getCreateDatetime() {
        return createDatetime;
    }

    /**
     * 设置创建时间
     *
     * @param createDatetime 创建时间
     */
    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }
}