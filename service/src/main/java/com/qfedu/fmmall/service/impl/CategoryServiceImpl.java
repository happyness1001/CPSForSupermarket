package com.qfedu.fmmall.service.impl;

import com.qfedu.fmmall.dao.CategoryMapper;
import com.qfedu.fmmall.dao.OrderItemMapper;
import com.qfedu.fmmall.dao.ProductMapper;
import com.qfedu.fmmall.entity.*;
import com.qfedu.fmmall.service.CategoryService;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Autowired
    private ProductMapper productMapper;
    /**
     * 查询分类列表（包含三个级别的分类）
     * @return
     */
    public ResultVO listCategories() {
//        List<OrderItem> orderItemList = orderItemMapper.selectAll();
//        Example example = new Example(CategoryVO.class);
//        Example.Criteria criteria = example.createCriteria();
//        criteria.andEqualTo("categoryLevel","1");
//        List<Category> categoryList = categoryMapper.selectByExample(example);
//        Map<String,Integer> map = new HashMap<>();
//        for(Category category : categoryList){
//            map.put(category.getCategoryId(),0);
//        }
//        for(OrderItem orderItem : orderItemList){
//            Product product = productMapper.selectByPrimaryKey(orderItem.getProductId());
//            map.put(product.getRootCategoryId(),(map.get(product.getRootCategoryId())+1));
//        }
        List<CategoryVO> categoryVOS = categoryMapper.selectAllCategories();
        ResultVO resultVO = new ResultVO(ResStatus.OK, "success", categoryVOS.subList(0,10));
        return resultVO;
    }

    /**
     * 查询所有一级分类，同时查询当前一级分类下销量最高的6个商品
     * @return
     */
    public ResultVO listFirstLevelCategories() {
        List<CategoryVO> categoryVOS = categoryMapper.selectFirstLevelCategories();
        ResultVO resultVO = new ResultVO(ResStatus.OK, "success", categoryVOS);
        return resultVO;
    }

}
