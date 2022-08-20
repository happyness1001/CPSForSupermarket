package com.qfedu.fmmall.service.impl;

import com.qfedu.fmmall.dao.UserAddrMapper;
import com.qfedu.fmmall.entity.UserAddr;
import com.qfedu.fmmall.service.UserAddrService;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class UserAddrServiceImpl implements UserAddrService {

    @Autowired
    private UserAddrMapper userAddrMapper;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    @Transactional(propagation = Propagation.SUPPORTS)
    public ResultVO listAddrsByUid(int userId) {
        Example example = new Example(UserAddr.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",userId);
        criteria.andEqualTo("status",1);

        List<UserAddr> userAddrs = userAddrMapper.selectByExample(example);
        ResultVO resultVO = new ResultVO(ResStatus.OK, "success", userAddrs);
        return resultVO;
    }

    @Override
    public ResultVO addNewAddress(UserAddr userAddr) {
        Date dateTime = new Date();
        userAddr.setCreateTime(dateTime);
        userAddr.setUpdateTime(dateTime);
        int i = userAddrMapper.insert(userAddr);
        if(i>0){
            return new ResultVO(ResStatus.OK,"success",null);
        }else{
            return new ResultVO(ResStatus.NO,"fail",null);
        }
    }
}
