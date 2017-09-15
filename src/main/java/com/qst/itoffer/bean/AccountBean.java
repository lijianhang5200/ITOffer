package com.qst.itoffer.bean;

import java.util.Date;

public class AccountBean {
	private int am_id,status,userrole,commpany_id;
	private String loginName,password,name,mobile;
	private Date expire_date;
	public int getAm_id() {
		return am_id;
	}
	public AccountBean setAm_id(int am_id) {
		this.am_id = am_id;
		return this;
	}
	public int getStatus() {
		return status;
	}
	public AccountBean setStatus(int status) {
		this.status = status;
		return this;
	}
	public int getUserrole() {
		return userrole;
	}
	public AccountBean setUserrole(int userrole) {
		this.userrole = userrole;
		return this;
	}
	public int getCommpany_id() {
		return commpany_id;
	}
	public AccountBean setCommpany_id(int commpany_id) {
		this.commpany_id = commpany_id;
		return this;
	}
	public String getLoginName() {
		return loginName;
	}
	public AccountBean setLogin_name(String loginName) {
		this.loginName = loginName;
		return this;
	}
	public String getPassword() {
		return password;
	}
	public AccountBean setPassword(String password) {
		this.password = password;
		return this;
	}
	public String getName() {
		return name;
	}
	public AccountBean setName(String name) {
		this.name = name;
		return this;
	}
	public String getMobile() {
		return mobile;
	}
	public AccountBean setMobile(String mobile) {
		this.mobile = mobile;
		return this;
	}
	public Date getExpire_date() {
		return expire_date;
	}
	public AccountBean setExpire_date(Date expire_date) {
		this.expire_date = expire_date;
		return this;
	}
}
