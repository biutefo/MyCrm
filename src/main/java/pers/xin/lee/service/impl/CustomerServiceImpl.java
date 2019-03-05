package pers.xin.lee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.util.StringUtils;
import pers.xin.lee.bean.Customer;
import pers.xin.lee.dao.CustomerMapper;
import pers.xin.lee.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerMapper customerMapper;

	@Override
	public List<Customer> selectAll() {
		List<Customer> customerList = customerMapper.selectCustomerList(null);
		return customerList;
	}

	@Override
	public Customer selectCustomerById(Integer id) {
		Customer customer = customerMapper.selectCustomerById(id);
		return customer;
	}

	@Override
	public void updateEmp(Customer customer) {
		customerMapper.updateCustomer(customer);
	}

	@Override
	public int createCustomer(Customer customer) {
		return customerMapper.createCustomer(customer);
	}

	@Override
	public int deleteCustomerList(List<Integer> delIdList) {
		return customerMapper.deleteCustomerList(delIdList);
	}

	@Override
	public int deleteCustomer(Integer custId) {
		return customerMapper.deleteCustomer(custId);
	}

	@Override
	public List<Customer> findCustomerList(String custName, String custSource, String custIndustry, String custLevel) {
		// 创建客户对象
		Customer customer = new Customer();
		// 判断客户名称
		if (!StringUtils.isEmpty(custName)) {
			customer.setCustName(custName);
		}
		// 判断客户信息来源
		if (!StringUtils.isEmpty(custSource)) {
			customer.setCustSource(custSource);
		}
		// 判断客户所属行业
		if (!StringUtils.isEmpty(custIndustry)) {
			customer.setCustIndustry(custIndustry);
		}
		// 判断客户级别
		if (!StringUtils.isEmpty(custLevel)) {
			customer.setCustLevel(custLevel);
		}

		List<Customer> customers = customerMapper.selectCustomerList(customer);
		return customers;
	}


}
