package com.qfedu.fmmall.service.impl;

import com.qfedu.fmmall.dao.*;
import com.qfedu.fmmall.entity.*;
import com.qfedu.fmmall.service.ProductService;
import com.qfedu.fmmall.utils.PageHelper;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductImgMapper productImgMapper;
    @Autowired
    private ProductSkuMapper productSkuMapper;
    @Autowired
    private ProductParamsMapper productParamsMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private RelatedProductsItemsMapper relatedProductsItemsMapper;
    @Autowired
    private RelatedProductsMapper relatedProductsMapper;

    public ResultVO listRecommendProducts(String userId) {
        if (userId == null) {
            List<ProductVO> productVOS = productMapper.selectRecommendProducts(0,3);
            ResultVO resultVO = new ResultVO(ResStatus.OK, "success", productVOS);
            return resultVO;
        } else {
            /*查询最近的订单id*/
            Example OrdersExample = new Example(Orders.class);
            OrdersExample.setOrderByClause("create_Time DESC");
            Example.Criteria OrdersCriteria = OrdersExample.createCriteria();
            OrdersCriteria.andEqualTo("userId", userId);
            RowBounds rowBounds = new RowBounds(0, 1);
            List<Orders> orders = ordersMapper.selectByExampleAndRowBounds(OrdersExample, rowBounds);
            /*如果是新用户没有订单，则返回销量最高的三个商品*/
            if(orders.size()==0){
                List<ProductVO> productVOS = productMapper.selectRecommendProducts(0,3);
                ResultVO resultVO = new ResultVO(ResStatus.OK, "success", productVOS);
                return resultVO;
            }
            System.out.println(orders.get(0).getOrderId());
            /*查询最近的一次订单所含有的商品id*/
            Example OrderItemExample = new Example(OrderItem.class);
            Example.Criteria criteria = OrderItemExample.createCriteria();
            criteria.andEqualTo("orderId", orders.get(0).getOrderId());
            List<OrderItem> orderItems = orderItemMapper.selectByExample(OrderItemExample);
            ArrayList<String> productsId = new ArrayList<>();
            for (OrderItem orderItem : orderItems) {
                productsId.add(orderItem.getProductId());
            }
            int amount = 0;
            /*这里可以限制考虑关联规则的商品数量*/
            /*if (productsId.size() > 3) {
                amount = 3;
            } else {
                amount = productsId.size();
            }*/
            amount = productsId.size();
            /*记录所有相关联的商品*/
            ArrayList<List<String>> relatedProductList = new ArrayList<>();
            /*记录所有相关联的规则id*/
            ArrayList<String> relatedId = new ArrayList<>();
            for (int i = 0; i < amount; i++) {
                Example exampleRelatedProductsItems = new Example(RelatedProductsItems.class);
                Example.Criteria criteriaRelatedProductsItems = exampleRelatedProductsItems.createCriteria();
                criteriaRelatedProductsItems.andEqualTo("productId",productsId.get(i));
                List<RelatedProductsItems> relateIdList = relatedProductsItemsMapper.selectByExample(exampleRelatedProductsItems);
                System.out.println("查看所有关联规则ID"+relateIdList.get(0).getRelatedId()+relateIdList.get(1).getRelatedId());
                for(int j = 0 ;j<relateIdList.size();j++){
                    Example exampleRelatedProductsItems1 = new Example(RelatedProductsItems.class);
                    Example.Criteria criteriaRelatedProductsItems1 = exampleRelatedProductsItems1.createCriteria();
                    criteriaRelatedProductsItems1.andEqualTo("relatedId",relateIdList.get(j).getRelatedId());
                    List<RelatedProductsItems> relateIdList1 = relatedProductsItemsMapper.selectByExample(exampleRelatedProductsItems1);
                    ArrayList<String> productIdList = new ArrayList<>();
                    for (RelatedProductsItems relateIdListItem:relateIdList1){
                        productIdList.add(relateIdListItem.getProductId());
                    }
                    //List<String> productIdList = relatedProductsItemsMapper.selectProductIdByProductId(relateIdList.get(j).getRelatedId());
                    if (!relatedProductList.contains(productIdList)) {
                        relatedProductList.add(productIdList);
                        relatedId.add(relateIdList.get(j).getRelatedId());
                    }
                }
            }
            /*处理关联商品列表*/
            for (int i = 0; i < amount; i++) {
                for(int j = 0 ;j<relatedProductList.size();j++){
                    relatedProductList.get(j).remove(productsId.get(i));
                }
            }
            for(int i = 0 ;i<relatedProductList.size();i++){
                if(relatedProductList.get(i).size()!=1){
                    relatedProductList.remove(i);
                    relatedId.remove(i);
                }
            }
            System.out.println(relatedProductList);
            int relatedProductSize = relatedProductList.size();
            ArrayList<ProductVO> productVOS = new ArrayList<>();
            if(relatedProductSize==0){
                productVOS.addAll(productMapper.selectRecommendProducts(0,3));
            }else if(relatedProductSize<3){
                productVOS.addAll(productMapper.selectRecommendProducts(0,3-relatedProductSize));
                for (int i = 0;i<relatedProductSize;i++){
                    productVOS.addAll(productMapper.selectRecommendProductsByProductId(relatedProductList.get(i).get(0)));
                }
            }else if(relatedProductSize==3){
                for (int i = 0;i<relatedProductSize;i++){
                    productVOS.addAll(productMapper.selectRecommendProductsByProductId(relatedProductList.get(i).get(0)));
                }
            }else{
                List<Double> confidence = new ArrayList<>();
                for(int i =0;i<relatedProductSize;i++){
                    confidence.add(relatedProductsMapper.selectConfidenceByRelatedId(relatedId.get(i)));
                }
                for(int i = 0 ;i<3 ; i++){
                    double maxConfidence = Collections.max(confidence);
                    int confidenceIndex = confidence.indexOf(maxConfidence);
                    confidence.remove(confidenceIndex);
                    relatedId.remove(confidenceIndex);
                    productVOS.addAll(productMapper.selectRecommendProductsByProductId(relatedProductList.get(confidenceIndex).get(0)));
                    relatedProductList.remove(confidenceIndex);
                }
            }

            ResultVO resultVO = new ResultVO(ResStatus.OK, "success", productVOS);
            return resultVO;
        }
    }


    @Transactional(propagation = Propagation.SUPPORTS)
    public ResultVO getProductBasicInfo(String productId) {
        //1.商品基本信息
        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",productId);
        criteria.andEqualTo("productStatus",1);//状态为1表示上架商品
        List<Product> products = productMapper.selectByExample(example);
        if(products.size()>0){
            //2.商品图片
            Example example1 = new Example(ProductImg.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andEqualTo("itemId",productId);
            List<ProductImg> productImgs = productImgMapper.selectByExample(example1);
            //3.商品套餐
            Example example2 = new Example(ProductSku.class);
            Example.Criteria criteria2 = example2.createCriteria();
            criteria2.andEqualTo("productId",productId);
            criteria2.andEqualTo("status",1);
            List<ProductSku> productSkus = productSkuMapper.selectByExample(example2);

            HashMap<String,Object> basicInfo = new HashMap<>();
            basicInfo.put("product",products.get(0));
            basicInfo.put("productImgs",productImgs);
            basicInfo.put("productSkus",productSkus);
            return new ResultVO(ResStatus.OK,"success",basicInfo);
        }else{
            return new ResultVO(ResStatus.NO,"查询的商品不存在！",null);
        }
    }

    @Override
    public ResultVO getProductParamsById(String productId) {
        Example example = new Example(ProductParams.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",productId);
        List<ProductParams> productParams = productParamsMapper.selectByExample(example);
        if(productParams.size()>0){
            return new ResultVO(ResStatus.OK,"success",productParams.get(0));
        }else{
            return new ResultVO(ResStatus.NO,"此商品可能为三无产品",null);
        }
    }

    @Override
    public ResultVO getProductsByCategoryId(int categoryId, int pageNum, int limit) {
        //1.查询分页数据
        int start = (pageNum-1)*limit;
        List<ProductVO> productVOS = productMapper.selectProductByCategoryId(String.valueOf(categoryId), start, limit);
        //2.查询当前类别下的商品的总记录数
        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("categoryId",String.valueOf(categoryId));
        int count = productMapper.selectCountByExample(example);
        //3.计算总页数
        int pageCount = count%limit==0? count/limit : count/limit+1;
        //4.封装返回数据
        PageHelper<ProductVO> pageHelper = new PageHelper<>(count, pageCount, productVOS);
        return new ResultVO(ResStatus.OK,"SUCCESS",pageHelper);
    }

    @Override
    public ResultVO listBrands(int categoryId) {
        List<String> brands = productMapper.selectBrandByCategoryId(String.valueOf(categoryId));
        return new ResultVO(ResStatus.OK,"success",brands);
    }

    @Override
    public ResultVO searchProduct(String kw, int pageNum, int limit) {
        //1.查询搜索结果
        kw = "%"+kw+"%";
        int start = (pageNum-1)*limit;
        List<ProductVO> productVOS = productMapper.selectProductByKeyword(kw, start, limit);
        
        //2.查询总记录数
        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("productName",kw);
        int count = productMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count%limit==0? count/limit:count/limit+1;

        //4.封装，返回数据
        PageHelper<ProductVO> pageHelper = new PageHelper<>(count, pageCount, productVOS);
        ResultVO resultVO = new ResultVO(ResStatus.OK, "SUCCESS", pageHelper);
        return resultVO;
    }

    @Override
    public ResultVO listBrands(String kw) {
        kw = "%"+kw+"%";
        List<String> brands = productMapper.selectBrandByKeyword(kw);
        return new ResultVO(ResStatus.OK,"SUCCESS",brands);
    }
}
