package com.sise.taotao.domain;

/*
 * 类名称: Address   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-30 下午4:21:34 
 * 修改备注:
 * @version 1.0.0
 */
public class Address {
	private String provincial;// 省
	private String city;// 市
	private String distric;// 区
	private String detailedAddress;// 详细地址
	private String uid;// 用户id
	private String aid;//主键

	public String getProvincial() {
		return provincial;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public void setProvincial(String provincial) {
		this.provincial = provincial;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistric() {
		return distric;
	}

	public void setDistric(String distric) {
		this.distric = distric;
	}

	public String getDetailedAddress() {
		return detailedAddress;
	}

	public void setDetailedAddress(String detailedAddress) {
		this.detailedAddress = detailedAddress;
	}

}
