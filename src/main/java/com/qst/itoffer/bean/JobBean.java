package com.qst.itoffer.bean;

import java.util.Date;

public class JobBean {
	private int job_id,company_id,job_hiringnum,job_status;
	private String job_name,job_salary,job_area,job_desc;
	private Date job_endtime;
	public int getJob_id() {
		return job_id;
	}
	public JobBean setJob_id(int job_id) {
		this.job_id = job_id;
		return this;
	}
	public int getCompany_id() {
		return company_id;
	}
	public JobBean setCompany_id(int company_id) {
		this.company_id = company_id;
		return this;
	}
	public int getJob_hiringnum() {
		return job_hiringnum;
	}
	public JobBean setJob_hiringnum(int job_hiringnum) {
		this.job_hiringnum = job_hiringnum;
		return this;
	}
	public int getJob_status() {
		return job_status;
	}
	public JobBean setJob_status(int job_status) {
		this.job_status = job_status;
		return this;
	}
	public String getJob_name() {
		return job_name;
	}
	public JobBean setJob_name(String job_name) {
		this.job_name = job_name;
		return this;
	}
	public String getJob_salary() {
		return job_salary;
	}
	public JobBean setJob_salary(String job_salary) {
		this.job_salary = job_salary;
		return this;
	}
	public String getJob_area() {
		return job_area;
	}
	public JobBean setJob_area(String job_area) {
		this.job_area = job_area;
		return this;
	}
	public String getJob_desc() {
		return job_desc;
	}
	public JobBean setJob_desc(String job_desc) {
		this.job_desc = job_desc;
		return this;
	}
	public Date getJob_endtime() {
		return job_endtime;
	}
	public JobBean setJob_endtime(Date job_endtime) {
		this.job_endtime = job_endtime;
		return this;
	}
}