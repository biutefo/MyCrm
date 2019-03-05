package pers.xin.lee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.xin.lee.bean.BaseDict;
import pers.xin.lee.dao.BaseDictMapper;
import pers.xin.lee.service.BaseDictService;

@Service
public class BaseDictServiceImpl implements BaseDictService {

	@Autowired
	BaseDictMapper baseDictMapper;

	@Override
	public List<BaseDict> selectBaseDictByTypeCode(String typecode) {

		List<BaseDict> baseDictList = baseDictMapper.selectBaseDictByTypeCode(typecode);
		return baseDictList;

	}

}
