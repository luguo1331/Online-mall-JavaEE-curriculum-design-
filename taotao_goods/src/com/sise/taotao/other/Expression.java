package com.sise.taotao.other;

/*
 * 类名称: Expression   
 * 类描述: 传递操作               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-25 下午2:29:10 
 * 修改备注:
 * @version 1.0.0
 */
public class Expression {
	private String name;
	private String operator;
	private String value;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "Expression [name=" + name + ", operator=" + operator
				+ ", value=" + value + "]";
	}

	public Expression() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Expression(String name, String operator, String value) {
		super();
		this.name = name;
		this.operator = operator;
		this.value = value;
	}
}
