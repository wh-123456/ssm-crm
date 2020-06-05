package com.hqyj.crm.test.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.crm.system.dao.UserMapper;
import com.hqyj.crm.system.entity.User;

@Controller
public class TestController {
	@Autowired
	private UserMapper userMapper;

	@RequestMapping("/test")
	@ResponseBody
	public String test() {
		User user = new User();
		user.setAccount("管理员");
//		user.setusername("admin");
		user.setCreateTime(new Date(System.currentTimeMillis()));
		int dd = userMapper.insertSelective(user);
		return "热部署成功了吗？";
	}
}
