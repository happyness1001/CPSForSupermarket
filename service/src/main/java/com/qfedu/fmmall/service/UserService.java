package com.qfedu.fmmall.service;

import com.qfedu.fmmall.entity.Users;
import com.qfedu.fmmall.vo.ResultVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface UserService {

    //用户注册
    public ResultVO userResgit(String name, String pwd);

    //用户登录
    public ResultVO checkLogin(String name, String pwd);
    //修改个人信息
    public ResultVO updateUser(Users user);
    //查询用户信息
    public ResultVO getUserById(String userId);

    public ResultVO saveOrUpdateImageFile(String id, MultipartFile image) throws IOException;

    public ResultVO getCommentById(String userId, int pageNum, int limit);

    public ResultVO getHistoryProduct(String userId);

    public ResultVO getReconciliation(String userId);
}
