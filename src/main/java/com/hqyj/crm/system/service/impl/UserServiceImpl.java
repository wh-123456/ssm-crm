package com.hqyj.crm.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.crm.system.dao.UserMapper;
import com.hqyj.crm.system.entity.User;
import com.hqyj.crm.system.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	/**
	 * 
	 * @author 赵丹钊
	 */
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> queryAllUser() {
		return userMapper.queryAllUser();
	}

	@Override
	public int addUser(User user) {
		
		return userMapper.insert(user);
	}

	@Override
	public int deleteUserByUserId(int userId) {
		return userMapper.deleteByPrimaryKey(userId);
	}

	@Override
	public User getUserDetail(int userId) {
		return userMapper.getUserDetail(userId) ;
	}

	@Override
	public int eidtUser(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public List<String> queryRoleByUserId(int userId) {
		List<String> li = userMapper.queryRoleByUserId(userId);
		System.out.println(li);
		return userMapper.queryRoleByUserId(userId);
	}


	/* (non-Javadoc)
	 * @see com.hqyj.crm.system.service.UserService#queryUserById(int)
	 */
	@Override
	public User queryUserById(int userId) {
		return userMapper.getUserDetail(userId);
	}

	/**
	 * zdl
	 */
	@Override
	public User queryUserByUsernameAndPassword(User user) {
		 user=userMapper.queryUserByUsernameAndPassword(user);
		return user;
	}

	/* (non-Javadoc)
	 * @see com.hqyj.crm.system.service.UserService#insertUser(com.hqyj.crm.system.entity.User)
	 */
	@Override
	public User insertUser(User user) {
		userMapper.insert(user);
		return user;
	}

	/* (non-Javadoc)
	 * @see com.hqyj.crm.system.service.UserService#updateUser(com.hqyj.crm.system.entity.User)
	 */
	@Override
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		 userMapper.updateByPrimaryKeySelective(user);
		 return user;
	}

	/* (non-Javadoc)
	 * @see com.hqyj.crm.system.service.UserService#userDeleBatch(java.lang.String[])
	 */
	@Override
	public int userDeleBatch(String[] userArry) {
		int[] idArray = new int[userArry.length];
		for (int i = 0; i < userArry.length; i++) {
			idArray[i] = Integer.parseInt(userArry[i]);
		}
		// 删除中间表对应角色的数据

		// 删除角色表对应的数据
		int flag = userMapper.deleUserBatch(idArray);
		if (flag == 0) {
			return 0;
		}
		return 1;
	}

	/* (non-Javadoc)
	 * @see com.hqyj.crm.system.service.UserService#queryRoleNameByUserId(int)
	 */
	@Override
	public String queryRoleNameByUserId(int userId) {
		// TODO Auto-generated method stub
		return userMapper.queryRoleNameByUserId(userId);
	}

}
