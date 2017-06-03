package com.sise.taotao.domain;

import java.util.List;

/*
 * 类名称: Order   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-4 下午6:09:08 
 * 修改备注:
 * @version 1.0.0
 */
public class Order {
	private String oid;// 主键
	private String ordertime;// 下单时间
	private double total;// 总计
	private int status;// 订单状态：1未付款, 2已付款但未发货, 3已发货未确认收货, 4确认收货了交易成功,
						// 5已取消(只有未付款才能取消)
	private String address;// 收货地址
	private User owner;// 订单的所有者
	private List<OrderItem> orderItemList;

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

}
