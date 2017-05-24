package com.sise.taotao.exception;

/*
 * 类名称: UserException   
 * 类描述: 用户业务异常               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-4 下午8:37:40 
 * 修改备注:
 * @version 1.0.0
 */
public class UserException extends Exception {

	public UserException() {
		super();
	}

	public UserException(String message, Throwable cause) {
		super(message, cause);
	}

	public UserException(String message) {
		super(message);
	}

	public UserException(Throwable cause) {
		super(cause);
	}

}
