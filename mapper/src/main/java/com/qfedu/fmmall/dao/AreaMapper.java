package com.qfedu.fmmall.dao;

import com.qfedu.fmmall.entity.Area;
import com.qfedu.fmmall.entity.AreaVo;
import com.qfedu.fmmall.entity.CategoryVO;
import com.qfedu.fmmall.general.GeneralDAO;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AreaMapper extends GeneralDAO<Area> {

    public List<AreaVo> selectFirstLevelAreas();

    //2.子查询：根据pid查询子分类
    public List<AreaVo> selectAllAreas2(int pid);

}