package pers.xin.lee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import pers.xin.lee.bean.Customer;

public interface CustomerMapper {

	/**
	 * 查询客户列表
	 * @param customer
	 * @return
	 */
	List<Customer> selectCustomerList(Customer customer);

	/**
	 * 查询客户总数
	 * @param customer
	 * @return
	 */
	Integer selectCustomerListCount(Customer customer);

	/**
	 * 根据id获取客户信息
	 * @param id
	 * @return
	 */
	Customer selectCustomerById(Integer id);
	
	/**
	 * 添加客户
	 * @param customer
	 * @return
	 */
	int createCustomer(Customer customer);

	/**
	 * 更新客户
	 * @param customer
	 * @return
	 */
	int updateCustomer(Customer customer);

	// 
	/**
	 * 根据id删除客户
	 * @param id
	 * @return
	 */
	int deleteCustomer(Integer id);

	/**
	 * 根据id列表删除多个客户
	 * @param delIdList
	 * @return
	 */
	int deleteCustomerList(List<Integer> delIdList);
}