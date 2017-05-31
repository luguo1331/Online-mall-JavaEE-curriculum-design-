package com.sise.taotao.domain;

/*
 * 类名称: CartItem   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-4 下午6:10:21 
 * 修改备注:
 * @version 1.0.0
 */
public class CartItem {
	private String cartItemId;// 主键
	private int quantity;// 数量
	private Goods goods;// 条目对应的商品
	private User user;// 所属用户
	
	public Goods getGoods() {
		return goods;
	}

	@Override
	public String toString() {
		return "CartItem [cartItemId=" + cartItemId + ", quantity=" + quantity
				+ ", goods=" + goods + ", user=" + user + "]";
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}



	public String getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(String cartItemId) {
		this.cartItemId = cartItemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
