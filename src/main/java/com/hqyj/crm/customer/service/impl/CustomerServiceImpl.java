package com.hqyj.crm.customer.service.impl;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.crm.customer.dao.CustomerMapper;
import com.hqyj.crm.customer.entity.CustSearch;
import com.hqyj.crm.customer.entity.Customer;
import com.hqyj.crm.customer.entity.Dict;
import com.hqyj.crm.customer.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerMapper customerMapper;

	@Override
	public PageInfo<Customer> queryCustomers(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Customer> customers = Optional.ofNullable(customerMapper.queryCustomers()).orElse(Collections.emptyList());
		return new PageInfo<Customer>(customers);
	}

	@Override
	public Customer insertCustomer(Customer customer) {
		customerMapper.insertSelective(customer);
		return customer;
	}

	@Override
	public Customer updataCustomer(Customer customer) {
		int n = customerMapper.updateByPrimaryKeySelective(customer);
		customer = customerMapper.selectByPrimaryKey(customer.getId());
		return customer;
	}

	@Override
	public boolean deleteCustomer(Integer id) {
		int num = customerMapper.deleteByPrimaryKey(id);
		if (num > 0) {
			return true;
		}
		return false;
	}

	@Override
	public PageInfo<Customer> queryCustomersBySelect(CustSearch customer) {
		PageHelper.startPage(customer.getPageNum(), customer.getPageSize());
		List<Customer> selected = Optional.ofNullable(customerMapper.queryCustomersBySelect(customer))
				.orElse(Collections.emptyList());
		return new PageInfo<Customer>(selected);
	}

	@Override
	public Map<String, List<String>> querySelectValues() {
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		try {
			Properties dict = PropertiesLoaderUtils.loadAllProperties("resource.properties");
			String industry_str = (String) dict.get("customer_dict_industry");
			String level_str = (String) dict.get("customer_dict_level");
			String source_str = (String) dict.get("customer_dict_source");
			int industry = Integer.parseInt(industry_str);
			int level = Integer.parseInt(level_str);
			int source = Integer.parseInt(source_str);
			List<String> industryList = customerMapper.queryDict(industry);
			List<String> levelList = customerMapper.queryDict(level);
			List<String> sourceList = customerMapper.queryDict(source);
			map.put("industry", industryList);
			map.put("level", levelList);
			map.put("source", sourceList);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public void deleteManyCustomer(String[] id_arr) {
		if (id_arr != null && id_arr.length != 0) {
			for (String idStr : id_arr) {
				customerMapper.deleteByPrimaryKey(Integer.parseInt(idStr));
			}
		}
	}

	@Override
	public boolean insertDict(String type, String dictName) {
		if (dictName == null || "".equals(dictName)) {
			return false;
		}
		String id = null;
		if ("客户来源".equals(type)) {
			id = "003";
		} else if ("客户级别".equals(type)) {
			id = "002";
		} else if ("所属行业".equals(type)) {
			id = "001";
		}
		if (id == null) {
			return false;
		}
		Dict dict = new Dict(id, dictName);
		Dict dict_db = customerMapper.dictIsExist(dict);
		if (dict_db != null) {
			return false;
		}
		int num = customerMapper.insertDict(dict);
//		boolean flag = (num == null) ? false : true;
		return true;
	}

}
