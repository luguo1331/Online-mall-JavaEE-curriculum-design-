package com.sise.taotao.domain;

/*
 * 类名称: OrderItem   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-4 下午6:08:25 
 * 修改备注:
 * @version 1.0.0
 */
public class OrderItem {
	private String orderItemId;// 主键
	private int quantity;// 数量
	private double subtotal;// 小计
	private Goods goods;// 所关联的商品
	private Order order;// 所属的订单

	public String getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
}
