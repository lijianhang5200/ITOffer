package com.qst.itoffer.bean;

import java.sql.Date;

public class ApplicantBean {
	private int applicant_id;
	private String applicant_email,applicant_pwd;
	private Date applicant_registerdate;
	public int getApplicant_id() {
		return applicant_id;
	}
	public ApplicantBean setApplicant_id(int applicant_id) {
		this.applicant_id = applicant_id;
		return this;
	}
	public String getApplicant_email() {
		return applicant_email;
	}
	public ApplicantBean setApplicant_email(String applicant_email) {
		this.applicant_email = applicant_email;
		return this;
	}
	public String getApplicant_pwd() {
		return applicant_pwd;
	}
	public ApplicantBean setApplicant_pwd(String applicant_pwd) {
		this.applicant_pwd = applicant_pwd;
		return this;
	}
	public Date getApplicant_registerdate() {
		return applicant_registerdate;
	}
	public ApplicantBean setApplicant_registerdate(Date applicant_registerdate) {
		this.applicant_registerdate = applicant_registerdate;
		return this;
	}
}
