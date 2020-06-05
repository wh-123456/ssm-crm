package com.hqyj.crm.customer.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.crm.customer.entity.CustSearch;
import com.hqyj.crm.customer.entity.Customer;

public interface CustomerService {

	PageInfo<Customer> queryCustomers(int pageNum,int pageSize );

	Customer insertCustomer(Customer customer);

	Customer updataCustomer(Customer customer);

	boolean deleteCustomer(Integer id);

	PageInfo<Customer> queryCustomersBySelect(CustSearch customer);

	Map<String, List<String>> querySelectValues();

	void deleteManyCustomer(String[] id_arr);

	boolean insertDict(String type, String dictName);

}
