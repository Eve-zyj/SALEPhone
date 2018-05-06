package controller;

import java.util.logging.Logger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.User;

import service.UserSevice;
import tools.Constants;

@Controller
@RequestMapping("/user")
public class UserController {
	private Logger logger = Logger.getLogger(String.valueOf(UserController.class));
	@Autowired
	private UserSevice userService;
	
	//显示登录和注册页面
	@RequestMapping(value="/login.html",method=RequestMethod.GET)
	public String login(HttpServletRequest request,Model model){
		Cookie[] cookies = request.getCookies();//读取cookie
		if(cookies!=null){
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("C_userpwd")){
					model.addAttribute("userpwd", cookie.getValue());
				}
				if(cookie.getName().equals("C_username")){	
					model.addAttribute("username", cookie.getValue());
				}
			}
		}
		return "login";
	}
	//处理登录页面
	@RequestMapping(value="/login.html",method=RequestMethod.POST)
	public String doLogin(User user,Model model,HttpSession session,@RequestParam(required=false) String remember,HttpServletResponse response){	
		
		//登陆处理
		int row = userService.login(user);
		if(row!=1){
			logger.warning("登录失败，row="+row);
			model.addAttribute("error1", "用户名与密码不匹配，请重新登录");
			return "login";
		}else{
			session.setAttribute(Constants.USER_SESSION, user);
			logger.info("登陆成功");
			//记住密码
			if(remember==null||remember==""){
				//创建cookie
				Cookie cookie1 = new Cookie("C_userpwd","");
				Cookie cookie2 = new Cookie("C_username","");
				//写入cookie
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}
			if(remember!=null && remember!=""){
				if("remember".equals(remember)){
					//创建cookie
					Cookie cookie1 = new Cookie("C_userpwd",user.getUserpassword());
					Cookie cookie2 = new Cookie("C_username",user.getUsername());
					//写入cookie
					response.addCookie(cookie1);
					response.addCookie(cookie2);
				}
			}
			return "redirect:/index.html";
		}
	}
	
	//判断用户名是否重复
	@RequestMapping(value="/existUsername")
	@ResponseBody
	public Object existUsername(@RequestParam String username){
		int row = userService.getUserByUsername(username);
		if(row==1){
			logger.warning("用户名重复，row="+row);
			return "{\"result\":\"exist\"}";//{"":""}
		}else{
			logger.warning("用户名可以使用，row="+row);
			return "{\"result\":\"noexist\"}";//{"":""}
		}		
	}
	//处理注册
	@RequestMapping(value="/register.html",method=RequestMethod.POST)
	public String doRegister(User user,Model model){
		int row = userService.addUser(user);
		if(row!=1){
			logger.warning("注册失败，row="+row);
			model.addAttribute("error2", "注册失败，请重新注册");
			return "login";
		}else{
			logger.info("注册成功");
			return "redirect:/user/login.html";
		}		
	}

	//注销
	@RequestMapping(value="/logout.html")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/user/login.html";
	}
}
