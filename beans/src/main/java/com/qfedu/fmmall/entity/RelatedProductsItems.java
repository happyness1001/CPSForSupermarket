package com.qfedu.fmmall.entity;

import javax.persistence.*;

@Table(name = "related_products_items")
public class RelatedProductsItems {
    /**
     * 关联子项目id
     */
    @Id
    @Column(name = "related_item_id")
    private String relatedItemId;

    /**
     * 商品id
     */
    @Column(name = "product_id")
    private String productId;

    /**
     * 关联规则id
     */
    @Column(name = "related_id")
    private String relatedId;

    /**
     * 获取关联子项目id
     *
     * @return related_item_id - 关联子项目id
     */
    public String getRelatedItemId() {
        return relatedItemId;
    }

    /**
     * 设置关联子项目id
     *
     * @param relatedItemId 关联子项目id
     */
    public void setRelatedItemId(String relatedItemId) {
        this.relatedItemId = relatedItemId;
    }

    /**
     * 获取商品id
     *
     * @return product_id - 商品id
     */
    public String getProductId() {
        return productId;
    }

    /**
     * 设置商品id
     *
     * @param productId 商品id
     */
    public void setProductId(String productId) {
        this.productId = productId;
    }

    /**
     * 获取关联规则id
     *
     * @return related_id - 关联规则id
     */
    public String getRelatedId() {
        return relatedId;
    }

    /**
     * 设置关联规则id
     *
     * @param relatedId 关联规则id
     */
    public void setRelatedId(String relatedId) {
        this.relatedId = relatedId;
    }
}