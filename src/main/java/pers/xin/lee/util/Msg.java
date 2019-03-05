package pers.xin.lee.util;

import java.util.HashMap;
import java.util.Map;

public class Msg {

	/**
	 * 状态码： 0-失败 1-成功
	 */
	private int code;

	/**
	 * 提示信息
	 */
	private String msg;

	private Map<String, Object> msgMap = new HashMap<String, Object>();

	public Msg() {
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getMsgMap() {
		return msgMap;
	}

	public void setMsgMap(Map<String, Object> msgMap) {
		this.msgMap = msgMap;
	}

	public static Msg createSuccessMsg() {
		Msg successMsg = new Msg();
		successMsg.setCode(1);
		successMsg.setMsg("处理成功");
		return successMsg;
	}

	public static Msg createFailureMsg() {
		Msg failureMsg = new Msg();
		failureMsg.setCode(0);
		failureMsg.setMsg("处理失败");
		return failureMsg;
	}

	public Msg put(String key, Object value) {
		this.getMsgMap().put(key, value);
		return this;
	}

}
