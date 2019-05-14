package com.order.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Customer {
	/**
	* 
	*/
	private Integer customerId;

	
	/**
	* 
	*/
	private Integer headImg;

    
	public Integer getHeadImg() {
		return headImg;
	}

	public void setHeadImg(Integer headImg) {
		this.headImg = headImg;
	}

	public Img getImg() {
		return img;
	}

	public void setImg(Img img) {
		this.img = img;
	}

	private Img img;

	/**
	* 
	*/
	private String phone;

	/**
	* 
	*/
	private String pwd;

	/**
	* 
	*/
	private Integer status;

	/**
	* 
	*/
	private Date createTime;

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", headImg=" + headImg + ", phone=" + phone + ", pwd=" + pwd
				+ ", status=" + status + ", createTime=" + createTime + "]";
	}

	
}