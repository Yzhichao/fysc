package com.sky.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.sky.commons.result.Tree;
import com.sky.commons.utils.PageInfo;
import com.sky.model.SysDscdnmB;
import com.sky.model.User;
import com.sky.model.vo.UserVo;

/**
 *
 * User 表数据服务层接口
 *
 */
public interface IUserService extends IService<User> {

    List<User> selectByLoginName(UserVo userVo);

    void insertByVo(UserVo userVo);

    UserVo selectVoById(Long id);

    void updateByVo(UserVo userVo);

    void updatePwdByUserId(Long userId, String md5Hex);

    void selectDataGrid(PageInfo pageInfo);

    void deleteUserById(Long id);
    
    List<Tree> selectTree(Long id);
    
    List<SysDscdnmB> selectAreaList(Long id);
    
    List<SysDscdnmB> selectAreaListByDscd(Long id);
}