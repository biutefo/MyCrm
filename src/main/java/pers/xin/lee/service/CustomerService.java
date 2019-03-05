package pers.xin.lee.service;

import java.util.List;
import pers.xin.lee.bean.Customer;

public interface CustomerService {

	List<Customer> selectAll();

	Customer selectCustomerById(Integer id);

	void updateEmp(Customer customer);

    int createCustomer(Customer customer);


	int deleteCustomerList(List<Integer> delIdList);

	int deleteCustomer(Integer custId);

    List<Customer> findCustomerList(String custName, String custSource, String custIndustry, String custLevel);
}
