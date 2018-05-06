package service;

import pojo.User;

public interface UserSevice {

	/**
	 * 登录
	 * @param user
	 * @return
	 */
	int login(User user);
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	int addUser(User user);
	/**
	 * 根据用户名查找用户
	 * @param username
	 * @return
	 */
	int getUserByUsername(String username);
}
