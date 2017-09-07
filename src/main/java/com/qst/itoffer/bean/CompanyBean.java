package com.qst.itoffer.bean;

import java.util.List;

public class CompanyBean {
	private int company_id;
	private String company_name,company_area,company_size,company_type,company_brief,company_viewnum,company_pic;
	private int company_state,company_sort;
	private List<JobBean> jobList;
	
	public int getCompany_id() {
		return company_id;
	}
	public CompanyBean setCompany_id(int company_id) {
		this.company_id = company_id;
		return this;
	}
	public String getCompany_name() {
		return company_name;
	}
	public CompanyBean setCompany_name(String company_name) {
		this.company_name = company_name;
		return this;
	}
	public String getCompany_area() {
		return company_area;
	}
	public CompanyBean setCompany_area(String company_area) {
		this.company_area = company_area;
		return this;
	}
	public String getCompany_size() {
		return company_size;
	}
	public CompanyBean setCompany_size(String company_size) {
		this.company_size = company_size;
		return this;
	}
	public String getCompany_type() {
		return company_type;
	}
	public CompanyBean setCompany_type(String company_type) {
		this.company_type = company_type;
		return this;
	}
	public String getCompany_brief() {
		return company_brief;
	}
	public CompanyBean setCompany_brief(String company_brief) {
		this.company_brief = company_brief;
		return this;
	}
	public String getCompany_viewnum() {
		return company_viewnum;
	}
	public CompanyBean setCompany_viewnum(String company_viewnum) {
		this.company_viewnum = company_viewnum;
		return this;
	}
	public String getCompany_pic() {
		return company_pic;
	}
	public CompanyBean setCompany_pic(String company_pic) {
		this.company_pic = company_pic;
		return this;
	}
	public int getCompany_state() {
		return company_state;
	}
	public CompanyBean setCompany_state(int company_state) {
		this.company_state = company_state;
		return this;
	}
	public int getCompany_sort() {
		return company_sort;
	}
	public CompanyBean setCompany_sort(int company_sort) {
		this.company_sort = company_sort;
		return this;
	}
	public List<JobBean> getJobList() {
		return jobList;
	}
	public void setJobList(List<JobBean> jobList) {
		this.jobList = jobList;
	}
}
