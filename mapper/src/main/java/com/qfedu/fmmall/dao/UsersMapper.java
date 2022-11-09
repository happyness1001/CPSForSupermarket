package com.qfedu.fmmall.dao;

import com.qfedu.fmmall.entity.Users;
import com.qfedu.fmmall.general.GeneralDAO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersMapper extends GeneralDAO<Users> {

    public int insertUser(Users users);

    public String getLatestUser();

}