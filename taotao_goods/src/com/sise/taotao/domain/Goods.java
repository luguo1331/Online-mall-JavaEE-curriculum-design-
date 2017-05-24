package com.sise.taotao.domain;

/*
 * 类名称: Goods   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-23 下午10:50:10 
 * 修改备注:
 * @version 1.0.0
 */
public class Goods {
	private String gid;// 主键
	private String gname;// 商品名
	private String image_1;//图一
	private String image_2;//图二
	private String image_3;//图三
	private String image_4;//图四
	private Double price;//定价
	private Double currPrice;//当前价格
	private Double discount;//折扣
	private String press;//描述
	private Category category;//分类
	private Integer monSales;//月销量
	private Integer totalSales;//总销量
	private Integer totalAssess;//总评价
	private Integer num;//库存
	private String type;//产品类型
	private String production;//原料产地
	private String materialsProduction;//产地
	private Integer spec;//产品规格
	private String batching;//配料表
	private Integer expirationDate;//生产许可证编号
	private String productStandardNumber;//产品标准号
	private String productionLicenseNumber;//
	private String storageMethod;//储存方法
	private String edibleMethod;//食用方法
	private Integer orderBy;//排序

	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", gname=" + gname + ", image_1="
				+ image_1 + ", image_2=" + image_2 + ", image_3=" + image_3
				+ ", image_4=" + image_4 + ", price=" + price + ", currPrice="
				+ currPrice + ", discount=" + discount + ", press=" + press
				+ ", category=" + category + ", monSales=" + monSales
				+ ", totalSales=" + totalSales + ", totalAssess=" + totalAssess
				+ ", num=" + num + ", type=" + type + ", production="
				+ production + ", materialsProduction=" + materialsProduction
				+ ", spec=" + spec + ", batching=" + batching
				+ ", expirationDate=" + expirationDate
				+ ", productStandardNumber=" + productStandardNumber
				+ ", productionLicenseNumber=" + productionLicenseNumber
				+ ", storageMethod=" + storageMethod + ", edibleMethod="
				+ edibleMethod + ", orderBy=" + orderBy + "]";
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getImage_1() {
		return image_1;
	}

	public void setImage_1(String image_1) {
		this.image_1 = image_1;
	}

	public String getImage_2() {
		return image_2;
	}

	public void setImage_2(String image_2) {
		this.image_2 = image_2;
	}

	public String getImage_3() {
		return image_3;
	}

	public void setImage_3(String image_3) {
		this.image_3 = image_3;
	}

	public String getImage_4() {
		return image_4;
	}

	public void setImage_4(String image_4) {
		this.image_4 = image_4;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getCurrPrice() {
		return currPrice;
	}

	public void setCurrPrice(Double currPrice) {
		this.currPrice = currPrice;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Integer getMonSales() {
		return monSales;
	}

	public void setMonSales(Integer monSales) {
		this.monSales = monSales;
	}

	public Integer getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(Integer totalSales) {
		this.totalSales = totalSales;
	}

	public Integer getTotalAssess() {
		return totalAssess;
	}

	public void setTotalAssess(Integer totalAssess) {
		this.totalAssess = totalAssess;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getProduction() {
		return production;
	}

	public void setProduction(String production) {
		this.production = production;
	}

	public String getMaterialsProduction() {
		return materialsProduction;
	}

	public void setMaterialsProduction(String materialsProduction) {
		this.materialsProduction = materialsProduction;
	}

	public Integer getSpec() {
		return spec;
	}

	public void setSpec(Integer spec) {
		this.spec = spec;
	}

	public String getBatching() {
		return batching;
	}

	public void setBatching(String batching) {
		this.batching = batching;
	}

	public Integer getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Integer expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getProductStandardNumber() {
		return productStandardNumber;
	}

	public void setProductStandardNumber(String productStandardNumber) {
		this.productStandardNumber = productStandardNumber;
	}

	public String getProductionLicenseNumber() {
		return productionLicenseNumber;
	}

	public void setProductionLicenseNumber(String productionLicenseNumber) {
		this.productionLicenseNumber = productionLicenseNumber;
	}

	public String getStorageMethod() {
		return storageMethod;
	}

	public void setStorageMethod(String storageMethod) {
		this.storageMethod = storageMethod;
	}

	public String getEdibleMethod() {
		return edibleMethod;
	}

	public void setEdibleMethod(String edibleMethod) {
		this.edibleMethod = edibleMethod;
	}

	public Integer getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(Integer orderBy) {
		this.orderBy = orderBy;
	}

}
