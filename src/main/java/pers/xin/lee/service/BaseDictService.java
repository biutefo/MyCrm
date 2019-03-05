package pers.xin.lee.service;

import java.util.List;

import pers.xin.lee.bean.BaseDict;

public interface BaseDictService {

	/**
	 * 根据类别代码查询数据字典
	 * @param typecode
	 * @return
	 */
	List<BaseDict> selectBaseDictByTypeCode(String typecode);

}
