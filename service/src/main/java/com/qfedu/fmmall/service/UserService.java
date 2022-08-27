package com.qfedu.fmmall.service;

import com.qfedu.fmmall.entity.Users;
import com.qfedu.fmmall.vo.ResultVO;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public interface UserService {

    //用户注册
    public ResultVO userResgit(String name, String pwd);

    //用户登录
    public ResultVO checkLogin(String name, String pwd);
    //修改个人信息
    public ResultVO updateUser(Users user);
    //查询用户信息
    public ResultVO getUserById(Integer userId);

    public ResultVO saveOrUpdateImageFile(int id, MultipartFile image) throws IOException;

    public ResultVO getCommentById(Integer userId,int pageNum,int limit);
}
