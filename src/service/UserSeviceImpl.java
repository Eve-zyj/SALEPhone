package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserMapper;

import pojo.User;
@Service
public class UserSeviceImpl implements UserSevice{

	@Autowired
	private UserMapper userMapper;
	@Override
	public int login(User user) {
		// TODO Auto-generated method stub
		return userMapper.login(user);
	}
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.addUser(user);
	}
	@Override
	public int getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.getUserByUsername(username);
	}

	
}
