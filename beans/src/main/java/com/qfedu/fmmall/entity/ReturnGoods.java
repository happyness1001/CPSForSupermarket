package com.qfedu.fmmall.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "return_goods")
public class ReturnGoods {
    /**
     * 退换货Id
     */
    @Id
    @Column(name = "return_id")
    private String returnId;

    /**
     * 物流公司
     */
    private String company;

    /**
     * 物流单号
     */
    @Column(name = "shipment_id")
    private String shipmentId;

    /**
     * 订单id
     */
    @Column(name = "order_id")
    private String orderId;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 退换货说明
     */
    private String content;

    /**
     * 获取退换货Id
     *
     * @return return_id - 退换货Id
     */
    public String getReturnId() {
        return returnId;
    }

    /**
     * 设置退换货Id
     *
     * @param returnId 退换货Id
     */
    public void setReturnId(String returnId) {
        this.returnId = returnId;
    }

    /**
     * 获取物流公司
     *
     * @return company - 物流公司
     */
    public String getCompany() {
        return company;
    }

    /**
     * 设置物流公司
     *
     * @param company 物流公司
     */
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * 获取物流单号
     *
     * @return shipment_id - 物流单号
     */
    public String getShipmentId() {
        return shipmentId;
    }

    /**
     * 设置物流单号
     *
     * @param shipmentId 物流单号
     */
    public void setShipmentId(String shipmentId) {
        this.shipmentId = shipmentId;
    }

    /**
     * 获取订单id
     *
     * @return order_id - 订单id
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * 设置订单id
     *
     * @param orderId 订单id
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * 获取联系人
     *
     * @return contact - 联系人
     */
    public String getContact() {
        return contact;
    }

    /**
     * 设置联系人
     *
     * @param contact 联系人
     */
    public void setContact(String contact) {
        this.contact = contact;
    }

    /**
     * 获取联系电话
     *
     * @return phone - 联系电话
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置联系电话
     *
     * @param phone 联系电话
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取退换货说明
     *
     * @return content - 退换货说明
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置退换货说明
     *
     * @param content 退换货说明
     */
    public void setContent(String content) {
        this.content = content;
    }
}