package com.hqyj.crm.customer.dao;

import java.util.List;

import com.hqyj.crm.customer.entity.CustSearch;
import com.hqyj.crm.customer.entity.Customer;
import com.hqyj.crm.customer.entity.Dict;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer id);

	int insert(Customer record);

	int insertSelective(Customer record);

	Customer selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Customer record);

	int updateByPrimaryKey(Customer record);

	List<Customer> queryCustomers();

	List<Customer> queryCustomersBySelect(CustSearch customer);

	List<String> queryDict(int parseInt);

	int insertDict(Dict dict);

	Dict dictIsExist(Dict dict);
}