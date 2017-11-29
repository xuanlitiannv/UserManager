package com.sau.edu.dao;

import java.util.List;

import com.sau.edu.bean.User;


public interface UserDao {

	//核对登录信息
	User getUserByName_Pswd(User user);
	
    //验证用户名(邮箱)是否重复    
	User getUserByEmail(String email);

	//注册添加用户（添加不需要返回对象等，每次一条信息）
	void add_regist_User(User user);

	//获取每条用户的信息
	List<User> listUser(User user);
    
	//管理员添加用户
	void addUser(User user);
    
	//获取对象信息
	User getUserById(Integer id);

	//更改用户信息
	void modifyUserById(User user);

	//删除用户
	void delUserById(Integer id);

	//通过email获取用户信息
	User getUser_permission_ByEmail(String email);
    
	
	
	

}
