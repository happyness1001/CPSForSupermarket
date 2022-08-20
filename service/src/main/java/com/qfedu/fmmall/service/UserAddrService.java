package com.qfedu.fmmall.service;

import com.qfedu.fmmall.entity.UserAddr;
import com.qfedu.fmmall.vo.ResultVO;

public interface UserAddrService {

    public ResultVO listAddrsByUid(int userId);

    public ResultVO addNewAddress(UserAddr userAddr);
}
