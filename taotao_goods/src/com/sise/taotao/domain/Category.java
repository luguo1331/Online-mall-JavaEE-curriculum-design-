package com.sise.taotao.domain;

import java.util.List;

/*
 * 类名称: Category   
 * 类描述: 分类模块的实体类               
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-4 下午6:05:56 
 * 修改备注:
 * @version 1.0.0
 */
public class Category {
	private String cid;// 主键
	private String cname;// 分类名称
	private Category parent;// 父分类
	private String desc;// 分类描述
	private List<Category> children;// 子分类
	private List<Goods> goods;// 货物
	private Integer orderBy;
	private String image;// 图片路径
	private String image_b;// 大图片路径

	public Integer getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(Integer orderBy) {
		this.orderBy = orderBy;
	}

	public List<Goods> getGoods() {
		return goods;
	}

	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}

	public String getImage_b() {
		return image_b;
	}

	public void setImage_b(String image_b) {
		this.image_b = image_b;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public List<Category> getChildren() {
		return children;
	}

	public void setChildren(List<Category> children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "Category [cid=" + cid + ", cname=" + cname + ", parent="
				+ parent + ", desc=" + desc + ", children=" + children
				+ ", goods=" + goods + ", orderBy=" + orderBy + ", image="
				+ image + ", image_b=" + image_b + "]";
	}

}
