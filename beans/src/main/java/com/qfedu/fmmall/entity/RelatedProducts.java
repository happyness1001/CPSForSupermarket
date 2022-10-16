package com.qfedu.fmmall.entity;

import java.math.BigDecimal;
import javax.persistence.*;

@Table(name = "related_products")
public class RelatedProducts {
    /**
     * id
     */
    @Id
    @Column(name = "related_id")
    private String relatedId;

    /**
     * 支持度
     */
    private BigDecimal support;

    /**
     * 置信度
     */
    private BigDecimal confidence;

    /**
     * 获取id
     *
     * @return related_id - id
     */
    public String getRelatedId() {
        return relatedId;
    }

    /**
     * 设置id
     *
     * @param relatedId id
     */
    public void setRelatedId(String relatedId) {
        this.relatedId = relatedId;
    }

    /**
     * 获取支持度
     *
     * @return support - 支持度
     */
    public BigDecimal getSupport() {
        return support;
    }

    /**
     * 设置支持度
     *
     * @param support 支持度
     */
    public void setSupport(BigDecimal support) {
        this.support = support;
    }

    /**
     * 获取置信度
     *
     * @return confidence - 置信度
     */
    public BigDecimal getConfidence() {
        return confidence;
    }

    /**
     * 设置置信度
     *
     * @param confidence 置信度
     */
    public void setConfidence(BigDecimal confidence) {
        this.confidence = confidence;
    }
}