package com.hqyj.crm.customer.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.crm.customer.entity.CustSearch;
import com.hqyj.crm.customer.entity.Customer;
import com.hqyj.crm.customer.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	/**
	 * 
	 * <p>
	 * 	客户列表
	 * </p>
	 * @author zdl
	 * @Date 2019年12月15日
	 * @return Customer的集合
	 */
	@RequestMapping("/list")
	public String customerList(Model model,@RequestParam(defaultValue="1") int pageNum,@RequestParam(defaultValue="8") int pageSize ){
		PageInfo<Customer> customers = customerService.queryCustomers(pageNum,pageSize );
		Map<String, List<String>> map = customerService.querySelectValues();
		model.addAttribute("customers", customers);
		model.addAttribute("map", map);
		return "customer/customerList";
	}
	@RequestMapping("/pageList")
	@ResponseBody
	@RequiresPermissions("customerList")
//	@RequiresRoles("admin")
	public PageInfo<Customer>  customerPageList(@RequestParam(defaultValue="1") int pageNum,@RequestParam(defaultValue="8") int pageSize ){
		return  customerService.queryCustomers(pageNum,pageSize );
		
	}
	/**
	 * 
	 * <p>
	 * 	新增客户 
	 * </p>
	 * @author zdl
	 * @Date 2019年12月15日
	 * @param customer 顾客对象
	 * @return	
	 */
	@ResponseBody
	@RequestMapping("/add")
	@RequiresPermissions("")
	public Customer addCustomer(Customer customer){
		return customerService.insertCustomer(customer);
	}
	/**
	 * 
	 * <p>
	 * 	修改客户
	 * </p>
	 * @author zdl
	 * @Date 2019年12月15日
	 * @param customer 顾客对象
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	@RequiresPermissions("customerEdit")
//	@RequiresRoles("admin")
	public Customer editCustomer(Customer customer){
		if(customer.getId()==null) {
			customer=customerService.insertCustomer(customer);
		}else {
			customer=customerService.updataCustomer(customer);
		}
		return  customer;
	}
	/**
	 * 
	 * <p>
	 * 	删除客户
	 * </p>
	 * @author zdl
	 * @Date 2019年12月15日
	 * @param id 客户的id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	@RequiresPermissions("customerDelete")
//	@RequiresRoles("admin")
	public boolean deleteCustomer(Integer id){
		return customerService.deleteCustomer(id);
	}
	/**
	 * 
	 * <p>
	 * 	根据选择的多个Id 同时删除
	 * </p>
	 * @author zdl
	 * @Date 2019年12月20日
	 * @param id_arr
	 * @return
	 */
	@RequestMapping("/deleteMany")
	@ResponseBody
	@RequiresPermissions("customerDeleteMany")
//	@RequiresRoles("admin")
	public boolean deleteManyCustomer(String[] id_arr){
		customerService.deleteManyCustomer(id_arr);
		return true;
	}
	/**
	 * 
	 * <p>
	 * 	查询用户
	 * </p>
	 * @author zdl
	 * @Date 2019年12月15日
	 * @param customer 可以根据任意字段查询
	 * @return
	 */
	@RequestMapping("/search")
	@ResponseBody
	@RequiresPermissions("customerSearch")
//	@RequiresRoles("admin")
	public PageInfo<Customer> searchCustomer(CustSearch customer){
		if(customer.getName()=="") {
			customer.setName(null);
		}
		if(customer.getIndustry()=="") {
			customer.setIndustry(null);
		}
		if(customer.getLevel()=="") {
			customer.setLevel(null);
		}
		if(customer.getSource()=="") {
			customer.setSource(null);
		}
		PageInfo<Customer> ddd = customerService.queryCustomersBySelect(customer);
		return ddd;
	}
	/**
	 * 
	 * <p>
	 * 	三个下拉框的值
	 * </p>
	 * @author zdl
	 * @Date 2019年12月15日
	 * @return int和List<String> 的map对象
	 */
	@RequestMapping("/select")
	@RequiresPermissions("dictSelect")
	public Map<String, List<String>> getSelectValues(){
		return customerService.querySelectValues();
	}
	/**
	 * 
	 * <p>
	 * 	新增字典表的数据
	 * </p>
	 * @author zdl
	 * @Date 2019年12月20日
	 * @param type
	 * @param dictName
	 * @return
	 */
	@RequestMapping("/addUIL")
	@ResponseBody
	@RequiresPermissions("dictAdd")
	public boolean addUIL(String type,String dictName) {
		return customerService.insertDict(type,dictName);
	}
	
	
	
	

}
