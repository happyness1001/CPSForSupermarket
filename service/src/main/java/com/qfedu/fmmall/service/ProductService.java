package com.qfedu.fmmall.service;

import com.qfedu.fmmall.vo.ResultVO;

public interface ProductService {

    public ResultVO listRecommendProducts(String userId);

    public ResultVO getProductBasicInfo(String productId);

    public ResultVO getProductParamsById(String productId);

    public ResultVO getProductsByCategoryId(String categoryId, int pageNum, int limit);

    public ResultVO listBrands(int categoryId);

    public ResultVO searchProduct(String kw,int pageNum,int limit);

    public ResultVO listBrands(String kw);
}

