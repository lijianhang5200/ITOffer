package com.qst.itoffer.bean;

import java.util.Date;

public class JobApplyBean {
	private int apply_id,job_id,applicant_id,apply_state;
	private Date apply_date;
	private JobBean jobBean;
	private CompanyBean companyBean;
	public int getApply_id() {
		return apply_id;
	}
	public JobApplyBean setApply_id(int apply_id) {
		this.apply_id = apply_id;
		return this;
	}
	public int getJob_id() {
		return job_id;
	}
	public JobApplyBean setJob_id(int job_id) {
		this.job_id = job_id;
		return this;
	}
	public int getApplicant_id() {
		return applicant_id;
	}
	public JobApplyBean setApplicant_id(int applicant_id) {
		this.applicant_id = applicant_id;
		return this;
	}
	public int getApply_state() {
		return apply_state;
	}
	public JobApplyBean setApply_state(int apply_state) {
		this.apply_state = apply_state;
		return this;
	}
	public Date getApply_date() {
		return apply_date;
	}
	public JobApplyBean setApply_date(Date apply_date) {
		this.apply_date = apply_date;
		return this;
	}
	public JobBean getJobBean() {
		return jobBean;
	}
	public JobApplyBean setJobBean(JobBean jobBean) {
		this.jobBean = jobBean;
		return this;
	}
	public CompanyBean getCompanyBean() {
		return companyBean;
	}
	public JobApplyBean setCompanyBean(CompanyBean companyBean) {
		this.companyBean = companyBean;
		return this;
	}
}
