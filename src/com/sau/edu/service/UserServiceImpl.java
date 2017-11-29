package com.sau.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.edu.bean.User;
import com.sau.edu.dao.UserDao;



@Service
public class UserServiceImpl implements UserService {
    
	@Autowired
    private UserDao udao;//依赖注入（数据库）
	@Override
	//登录
	public User login(User user) {
		// TODO Auto-generated method stub
	    User us=null;
	    
	    //根据用户名获取用户信息,验证密码是否正确
	    us=udao.getUserByName_Pswd(user);
	    
		return us;
	}
	@Override
	public boolean regist(User user) {
		// TODO Auto-generated method stub
		 boolean isSuccess = false;
		
		 //只有查询才会返回对象，除此之外都不返回
		 udao.add_regist_User(user);
			
		 isSuccess = true;
			
		 return isSuccess;
	}
	
	@Override
	public boolean isEmail(String email) {
		// TODO Auto-generated method stub
        boolean isSuccess = false;
		
		User us = udao.getUserByEmail(email);
		
		if(us!=null){
			
			isSuccess = true;
		}
		
		return isSuccess;
	}
	@Override
	public PageInfo<User> pageUser(User user, Integer pageNum, Integer pageSize) {
		// TODO Auto-generated method stub
		PageInfo<User>page=null;
		
		//获取第PageNum页，默认查询pageSize条信息
		PageHelper.startPage(pageNum,pageSize);
		
		//获取每条信息对象的集合用List
		List<User> ulist = udao.listUser(user);
		
		//获取分页后的结果
		page=new PageInfo<User>(ulist);
		
		return page;
	}
	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		boolean isSuccess=false;
		
		udao.addUser(user);
		
		isSuccess=true;
		
		return isSuccess;
	}
	@Override 
	public User detailUser(Integer id) {
		// TODO Auto-generated method stub
		
	    User user=null;
	    
	    user=udao.getUserById(id);
	    
		return user;
	}
	@Override
	public boolean modifyUser(User user) {
		// TODO Auto-generated method stub
		
		boolean isSuccess=false;
		
		udao.modifyUserById(user);
		
		isSuccess=true;
		
		return isSuccess;
	}
	@Override
	public boolean delUser(Integer id) {
		// TODO Auto-generated method stub
		boolean isSuccess=false;
		
		udao.delUserById(id);
		
		isSuccess=true;
		return isSuccess;
	}
	@Override
	public User detailUser(String email) {
		// TODO Auto-generated method stub
        User user=null;
	    
	    user=udao.getUser_permission_ByEmail(email);
	    
		return user;
	}

}
