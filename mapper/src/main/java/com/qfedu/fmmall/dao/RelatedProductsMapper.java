package com.qfedu.fmmall.dao;

import com.qfedu.fmmall.entity.RelatedProducts;
import com.qfedu.fmmall.general.GeneralDAO;
import org.springframework.stereotype.Repository;

@Repository
public interface RelatedProductsMapper extends GeneralDAO<RelatedProducts> {

    public Double selectConfidenceByRelatedId(String relatedId);

}