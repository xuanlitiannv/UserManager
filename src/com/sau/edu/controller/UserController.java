package com.sau.edu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageInfo;
import com.mysql.fabric.Response;
import com.sau.edu.bean.User;
import com.sau.edu.service.UserService;


@Controller
@RequestMapping("/user")
@SessionAttributes({"loguser"})
public class UserController {
    
	@Autowired
	private UserService uservice;//依赖注入（后台服务）
	
	//登录功能
	@RequestMapping("/login.do")
	@ResponseBody
	public  Map<String,Object> login(User user,ModelMap model){
		
		Map<String,Object> result=new HashMap<String, Object>();
		
		//调用service方法处理请求
	    User us=uservice.login(user);
	    
	    //生成响应
	    if(us!=null){
	    	model.addAttribute("loguser",user);
	    	
	    	result.put("tip", "success");
	    }else{
	    	result.put("tip", "error");
	    }
        
	    return result;
	}
	
	//验证用户名是否重复（切记传的是name值）
	@RequestMapping("/isEmail.do")
	@ResponseBody
	public Map<String,Object>isEmail(String Email){
		
		Map<String,Object> result=new HashMap<String,Object>();
		
		//调用service方法处理请求
		boolean isSuccess = uservice.isEmail(Email);
		
		//生成响应
		if(isSuccess){
			result.put("valid", "false");
		}else{
			result.put("valid", "true");
		}
		return result;
	}
	
	//注册功能（返回result成功与否的string,response.tip）
	@RequestMapping("/regist.do")
	@ResponseBody
	public Map<String,Object>regist(User user){
		
        Map<String,Object> result=new HashMap<String,Object>();
		
		//调用service方法处理请求
        boolean isSuccess=uservice.regist(user);
		
		//生成响应
		if( isSuccess){
			result.put("tip", "success");
		}else{
			result.put("tip", "error");
		}
		return result;
	}
	
	//列表信息展现功能(返回信息page对象,response.page)
	@RequestMapping("/listUser.do")
	@ResponseBody
	public Map<String,Object>listUser(User user,Integer pageNum,Integer pageSize){
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		//设置分页信息     pageNum是当前页码，pageSize是每页显示的信息数
		 if(pageNum==null||pageNum==0){
			  pageNum=1;
		 }
		 if(pageSize==null){
			 pageSize=5;
		 }
		 //设置查询信息(可查出相似的用户)
		 if(user.getEmail()!=null){
			 user.setEmail("%"+user.getEmail()+"%");
		 }
		 if(user.getPhone()!=null){
			 user.setPhone("%"+user.getPhone()+"%");
		 }
		 if(user.getRealname()!=null){
			 user.setRealname("%"+user.getRealname()+"%");
		 }
		 
		//调用service方法处理请求(PageInfo是个分页类型，引入mybatis分页插件)
		PageInfo<User>page = uservice.pageUser(user,pageNum,pageSize);
		
		map.put("page", page);
		return map;
	}
	
	//管理员添加用户
	@RequestMapping("/addUser.do")
	@ResponseBody
	public Map<String,Object>addUser(User user){
		
		Map<String,Object>result=new HashMap<String,Object>();
		
		//调用service方法处理请求
		boolean isSuccess=uservice.addUser(user);
		
		//生成响应
		if(isSuccess){
			result.put("tip", "success");
		}else{
			result.put("tip", "error");
		}
		return result;
	}
	
	//获取用户的信息(返回user对象,response.user)
	@RequestMapping("/getUserById.do")
	@ResponseBody
	public Map<String,Object>getUserById(Integer id){
		
		Map<String,Object>map=new HashMap<String,Object>();
		
		//调用service方法处理请求
		User user=uservice.detailUser(id);
		
		//生成响应
		map.put("user", user);
		return map;
	}
	
	//获取用户的信息（返货user对象，response。user）
	@RequestMapping("/getUserByEmail.do")
	@ResponseBody
	public Map<String,Object>getUserByEmail(String email){
		
		Map<String,Object>map=new HashMap<String,Object>();
		
		//调用service方法处理请求
				User user=uservice.detailUser(email);
				
				//生成响应
				map.put("user", user);
				return map;
	}
	
	@RequestMapping("/modifyUser.do")
	@ResponseBody
	public Map<String,Object>modifyUser(User user){
		
		Map<String,Object>result=new HashMap<String,Object>();
		
		//调用service方法处理请求
		boolean isSuccess=uservice.modifyUser(user);
		
		//生成响应
		if(isSuccess){
			result.put("tip", "success");
		}else{
			result.put("tip", "error");
		}
		return result;
	}
	@RequestMapping("/delUser.do")
	@ResponseBody
	public Map<String,Object>delUser(Integer id,HttpSession session){
		
		Map<String,Object>result=new HashMap<String,Object>();
		
		//调用service方法处理请求
		boolean isSuccess=uservice.delUser(id);
		
		//生成响应
		if(isSuccess){
			result.put("tip", "success");
		}else{
			result.put("tip", "error");
		}
		return result;
	}
}
