package com.sau.edu.service;

import com.github.pagehelper.PageInfo;
import com.sau.edu.bean.User;


public interface UserService {

	User login(User user);

	boolean regist(User user);

	boolean isEmail(String email);

	PageInfo<User> pageUser(User user, Integer pageNum, Integer pageSize);

	boolean addUser(User user);

	User detailUser(Integer id);

	boolean modifyUser(User user);

	boolean delUser(Integer id);

	User detailUser(String email);

	

	

}
