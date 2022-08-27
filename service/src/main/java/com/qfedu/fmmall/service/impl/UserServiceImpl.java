package com.qfedu.fmmall.service.impl;

import com.qfedu.fmmall.dao.UsersMapper;
import com.qfedu.fmmall.entity.ProductComments;
import com.qfedu.fmmall.entity.ProductCommentsVO;
import com.qfedu.fmmall.entity.Users;
import com.qfedu.fmmall.service.UserService;
import com.qfedu.fmmall.utils.Base64Utils;
import com.qfedu.fmmall.utils.MD5Utils;
import com.qfedu.fmmall.utils.PageHelper;
import com.qfedu.fmmall.vo.ResStatus;
import com.qfedu.fmmall.vo.ResultVO;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private ProductCommontsServiceImpl productCommontsService;



    @Transactional
    public ResultVO userResgit(String name, String pwd) {
        synchronized (this) {
            //1.根据用户查询，这个用户是否已经被注册
            Example example = new Example(Users.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("username", name);
            List<Users> users = usersMapper.selectByExample(example);

            //2.如果没有被注册则进行保存操作
            if (users.size() == 0) {
                String md5Pwd = MD5Utils.md5(pwd);
                Users user = new Users();
                user.setUsername(name);
                user.setPassword(md5Pwd);
                user.setUserImg("img/default.png");
                user.setUserRegtime(new Date());
                user.setUserModtime(new Date());
                int i = usersMapper.insertUseGeneratedKeys(user);
                if (i > 0) {
                    return new ResultVO(ResStatus.OK, "注册成功！", user);
                } else {
                    return new ResultVO(ResStatus.NO, "注册失败！", null);
                }
            } else {
                return new ResultVO(ResStatus.NO, "用户名已经被注册！", null);
            }
        }
    }

    @Override
    public ResultVO checkLogin(String name, String pwd) {
        Example example = new Example(Users.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username", name);
        List<Users> users = usersMapper.selectByExample(example);

        if(users.size() == 0){
            return new ResultVO(ResStatus.NO,"登录失败，用户名不存在！",null);
        }else{
            String md5Pwd = MD5Utils.md5(pwd);
            if(md5Pwd.equals(users.get(0).getPassword())){
                //如果登录验证成功，则需要生成令牌token（token就是按照特定规则生成的字符串）
                //使用jwt规则生成token字符串
                JwtBuilder builder = Jwts.builder();
                
                HashMap<String,Object> map = new HashMap<>();
                map.put("key1","value1");
                map.put("key2","value2");

                String token = builder.setSubject(name)                     //主题，就是token中携带的数据
                        .setIssuedAt(new Date())                            //设置token的生成时间
                        .setId(users.get(0).getUserId() + "")               //设置用户id为token  id
                        .setClaims(map)                                     //map中可以存放用户的角色权限信息
                        .setExpiration(new Date(System.currentTimeMillis() + 24*60*60*1000)) //设置token过期时间
                        .signWith(SignatureAlgorithm.HS256, "QIANfeng6666")     //设置加密方式和加密密码
                        .compact();

                return new ResultVO(ResStatus.OK,token,users.get(0));
            }else{
                return new ResultVO(ResStatus.NO,"登录失败，密码错误！",null);
            }
        }
    }

    @Override
    public ResultVO updateUser(Users user) {
        Users users = usersMapper.selectByPrimaryKey(user.getUserId());
        if(user.getPassword()!=""||user.getPassword()!=null){
            String md5Pwd = MD5Utils.md5(user.getPassword());
            users.setPassword(md5Pwd);
        }
        users.setUserImg(user.getUserImg());
        users.setNickname(user.getNickname());
        users.setRealname(user.getRealname());
        users.setUserBirth(user.getUserBirth());
        users.setUserEmail(user.getUserEmail());
        users.setUserSex(user.getUserSex());
        users.setUserMobile(user.getUserMobile());
        int i = usersMapper.updateByPrimaryKeySelective(users);
        if(i==1){
            return new ResultVO(ResStatus.OK,"sucesss","");
        }
        return new ResultVO(ResStatus.NO,"FAILED","");
    }

    @Override
    public ResultVO getUserById(Integer userId) {
       Users users = usersMapper.selectByPrimaryKey(userId);
        return new ResultVO(ResStatus.OK,"sucesss",users);
    }

    @Override
    public ResultVO saveOrUpdateImageFile(int id, MultipartFile image) throws IOException {
        String path ="D:\\Users\\ASUS\\Desktop\\CPSForSupermarket\\fmall-static\\static\\img";
        String suffix = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
        suffix = suffix.toLowerCase();
        if(suffix.equals(".jpg") || suffix.equals(".jpeg") || suffix.equals(".png") || suffix.equals(".gif")){
            String fileName = String.valueOf(id)+suffix;
            File targetFile = new File(path, fileName);
            if(!targetFile.getParentFile().exists()){    //注意，判断父级路径是否存在
                targetFile.getParentFile().mkdirs();
            }
            long size = 0;
            //保存
            try {
                image.transferTo(targetFile);
                size = image.getSize();
            } catch (Exception e) {
                e.printStackTrace();
            }
            Users users = usersMapper.selectByPrimaryKey(id);
            users.setUserImg("img/"+fileName);
            int i = usersMapper.updateByPrimaryKeySelective(users);
            if(i==1){
                return new ResultVO(ResStatus.OK,"sucesss","");
            }
            return new ResultVO(ResStatus.NO,"FAILED","");
        }else{
            return new ResultVO(ResStatus.NO,"图片格式错误","");
        }

    }

    @Override
    public ResultVO getCommentById(Integer userId,int pageNum,int limit) {

        return productCommontsService.getCommentByUser(userId,pageNum,limit);
    }
}
