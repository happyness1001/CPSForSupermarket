package com.qfedu.fmmall.dao;

import com.qfedu.fmmall.entity.RelatedProductsItems;
import com.qfedu.fmmall.general.GeneralDAO;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface RelatedProductsItemsMapper extends GeneralDAO<RelatedProductsItems> {

    public List<String> selectOrderIdByProductId(String productId);

    public List<String> selectProductIdByProductId(String relatedId);
}