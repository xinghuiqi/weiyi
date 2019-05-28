package com.weiyi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weiyi.mapper.UserMapper;
import com.weiyi.model.User;
import com.weiyi.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper mapper;
	
	public void save(User user) {
		// TODO Auto-generated method stub
		mapper.save(user);
	}

	public boolean update(User user) {
		// TODO Auto-generated method stub
		return mapper.update(user);
	}

	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return mapper.delete(id);
	}

	public User findById(int id) {
		// TODO Auto-generated method stub
		User user=mapper.findById(id);
		return user;
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		List<User> findAllList=mapper.findAll();
		return findAllList;
	}

}
