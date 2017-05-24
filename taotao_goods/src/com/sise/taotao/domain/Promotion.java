package com.sise.taotao.domain;

/*
 * 类名称: Promotion   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午5:08:38 
 * 修改备注:
 * @version 1.0.0
 */
public class Promotion {

	private String pid;// 主键
	private String h1;// 描述一
	private String h2;// 描述二
	private String image;// 图片

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getH1() {
		return h1;
	}

	public void setH1(String h1) {
		this.h1 = h1;
	}

	public String getH2() {
		return h2;
	}

	public void setH2(String h2) {
		this.h2 = h2;
	}

}
