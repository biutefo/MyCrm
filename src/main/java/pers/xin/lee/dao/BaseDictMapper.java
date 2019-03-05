package pers.xin.lee.dao;

import java.util.List;

import pers.xin.lee.bean.BaseDict;

public interface BaseDictMapper {
	/**
	 * 根据类别代码查询数据字典
	 * @param typecode
	 * @return
	 */
    public List<BaseDict> selectBaseDictByTypeCode(String typecode);
}