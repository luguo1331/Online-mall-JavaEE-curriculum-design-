package com.sise.taotao.domain;

/*
 * 类名称: Activity   
 * 类描述:                
 * 创建人: 凌威      
 * 修改人:  
 * 修改时间:2017-5-22 下午6:10:48 
 * 修改备注:
 * @version 1.0.0
 */
public class Activity {
	private String pid;// 主键
	private String image;// 图片
	private String title;// 标题
	private String press;// 描述

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

}
