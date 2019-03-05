package pers.xin.lee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.xin.lee.bean.BaseDict;
import pers.xin.lee.service.BaseDictService;
import pers.xin.lee.util.Msg;

@Controller
public class BaseDictController {

	@Autowired
	BaseDictService baseDictService;

	// 客户来源
	@Value("${customer.from.type}")
	private String FROM_TYPE;

	// 客户所属行业
	@Value("${customer.industry.type}")
	private String INDUSTRY_TYPE;

	// 客户级别
	@Value("${customer.level.type}")
	private String LEVEL_TYPE;

	@ResponseBody
	@RequestMapping(value = "baseDicts",method = RequestMethod.GET)
	public Msg baseDicts() {
		// 所有客户来源
		List<BaseDict> fromType = baseDictService.selectBaseDictByTypeCode(FROM_TYPE);
		// 所有客户所属行业
		List<BaseDict> industryType = baseDictService.selectBaseDictByTypeCode(INDUSTRY_TYPE);
		// 所有客户级别
		List<BaseDict> levelType = baseDictService.selectBaseDictByTypeCode(LEVEL_TYPE);
		return Msg.createSuccessMsg().put("fromType", fromType)
				.put("industryType", industryType)
				.put("levelType", levelType);
	}

}
