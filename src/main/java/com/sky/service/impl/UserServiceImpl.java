package com.sky.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sky.commons.result.Tree;
import com.sky.commons.shiro.ShiroUser;
import com.sky.commons.utils.BeanUtils;
import com.sky.commons.utils.PageInfo;
import com.sky.commons.utils.StringUtils;
import com.sky.mapper.UserMapper;
import com.sky.mapper.UserRoleMapper;
import com.sky.model.SysDscdnmB;
import com.sky.model.User;
import com.sky.model.UserRole;
import com.sky.model.vo.UserVo;
import com.sky.service.IUserService;

/**
 *
 * User 表数据服务层接口实现类
 *
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    
    @Override
    public List<User> selectByLoginName(UserVo userVo) {
        User user = new User();
        user.setLoginName(userVo.getLoginName());
        EntityWrapper<User> wrapper = new EntityWrapper<User>(user);
        if (null != userVo.getId()) {
            wrapper.where("id != {0}", userVo.getId());
        }
        return this.selectList(wrapper);
    }

    @Override
    public void insertByVo(UserVo userVo) {
        User user = BeanUtils.copy(userVo, User.class);
        user.setCreateTime(new Date());
        this.insert(user);
        
        Long id = user.getId();
        String[] roles = userVo.getRoleIds().split(",");
        UserRole userRole = new UserRole();

        for (String string : roles) {
            userRole.setUserId(id);
            userRole.setRoleId(Long.valueOf(string));
            userRoleMapper.insert(userRole);
        }
    }

    @Override
    public UserVo selectVoById(Long id) {
        return userMapper.selectUserVoById(id);
    }

    @Override
    public void updateByVo(UserVo userVo) {
        User user = BeanUtils.copy(userVo, User.class);
        if (StringUtils.isBlank(user.getPassword())) {
            user.setPassword(null);
        }
        this.updateById(user);
        
        Long id = userVo.getId();
        List<UserRole> userRoles = userRoleMapper.selectByUserId(id);
        if (userRoles != null && !userRoles.isEmpty()) {
            for (UserRole userRole : userRoles) {
                userRoleMapper.deleteById(userRole.getId());
            }
        }

        String[] roles = userVo.getRoleIds().split(",");
        UserRole userRole = new UserRole();
        for (String string : roles) {
            userRole.setUserId(id);
            userRole.setRoleId(Long.valueOf(string));
            userRoleMapper.insert(userRole);
        }
    }

    @Override
    public void updatePwdByUserId(Long userId, String md5Hex) {
        User user = new User();
        user.setId(userId);
        user.setPassword(md5Hex);
        this.updateById(user);
    }

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<UserVo> page = new Page<UserVo>(pageInfo.getNowpage(), pageInfo.getSize());
        List<UserVo> list = userMapper.selectUserVoPage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public void deleteUserById(Long id) {
        this.deleteById(id);
        List<UserRole> userRoles = userRoleMapper.selectByUserId(id);
        if (userRoles != null && !userRoles.isEmpty()) {
            for (UserRole userRole : userRoles) {
                userRoleMapper.deleteById(userRole.getId());
            }
        }
    }
    
    @Override
    public List<Tree> selectTree(Long id) {
    	List<SysDscdnmB> areaList=null;
    	if(id==null) {
    		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        	areaList = selectAreaListByDscd(Long.valueOf(user.getDscd()));
    	}else {
    		areaList = selectAreaList(id);
    	}

        List<Tree> trees = new ArrayList<Tree>();
        if (areaList != null) {
            for (SysDscdnmB area : areaList) {
                Tree tree = new Tree();
                tree.setId( Long.parseLong(area.getDscd()));
                tree.setText(area.getDsnm());
                tree.setPid( Long.parseLong(area.getDsupcd()));
                
                if(id==null){
                	tree.setChildren(selectTree(Long.parseLong(area.getDscd())));
                	tree.setState("open");
                }else{
                	tree.setState("closed");
                }
                trees.add(tree);
            }
        }
        
        return trees;
    }
    
    @Override
    public List<SysDscdnmB> selectAreaList(Long id) {
        return userMapper.selectAreaList(id);
    }

    @Override
    public List<SysDscdnmB> selectAreaListByDscd(Long id) {
        return userMapper.selectAreaListByDscd(id);
    }
}