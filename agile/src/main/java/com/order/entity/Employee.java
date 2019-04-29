package com.order.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Employee {
	/**
	* 
	*/
	private Integer employeeId;

	private String account;

	private String pwd;

	private String phone;

	private String name;

	private Date createTime;

	private Integer status;

	private Role role;

	private Img headImg;

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Img getHeadImg() {
		return headImg;
	}

	public void setHeadImg(Img headImg) {
		this.headImg = headImg;
	}

	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", account=" + account + ", pwd=" + pwd + ", phone=" + phone
				+ ", name=" + name + ", createTime=" + createTime + ", status=" + status + ", role=" + role
				+ ", headImg=" + headImg + "]";
	}

	
}