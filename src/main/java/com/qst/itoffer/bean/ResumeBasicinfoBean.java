package com.qst.itoffer.bean;

public class ResumeBasicinfoBean {
	private int basicinfo_id,applicant_id,gender;
	private String realname,current_loc,resident_loc,telephone,email,job_intension,job_experience,head_shot,birthday;
	public int getBasicinfo_id() {
		return basicinfo_id;
	}
	public ResumeBasicinfoBean setBasicinfo_id(int basicinfo_id) {
		this.basicinfo_id = basicinfo_id;
		return this;
	}
	public int getApplicant_id() {
		return applicant_id;
	}
	public ResumeBasicinfoBean setApplicant_id(int applicant_id) {
		this.applicant_id = applicant_id;
		return this;
	}
	public String getRealname() {
		return realname;
	}
	public ResumeBasicinfoBean setRealname(String realname) {
		this.realname = realname;
		return this;
	}
	public int getGender() {
		return gender;
	}
	public ResumeBasicinfoBean setGender(int gender) {
		this.gender = gender;
		return this;
	}
	public String getCurrent_loc() {
		return current_loc;
	}
	public ResumeBasicinfoBean setCurrent_loc(String current_loc) {
		this.current_loc = current_loc;
		return this;
	}
	public String getResident_loc() {
		return resident_loc;
	}
	public ResumeBasicinfoBean setResident_loc(String resident_loc) {
		this.resident_loc = resident_loc;
		return this;
	}
	public String getTelephone() {
		return telephone;
	}
	public ResumeBasicinfoBean setTelephone(String telephone) {
		this.telephone = telephone;
		return this;
	}
	public String getEmail() {
		return email;
	}
	public ResumeBasicinfoBean setEmail(String email) {
		this.email = email;
		return this;
	}
	public String getJob_intension() {
		return job_intension;
	}
	public ResumeBasicinfoBean setJob_intension(String job_intension) {
		this.job_intension = job_intension;
		return this;
	}
	public String getJob_experience() {
		return job_experience;
	}
	public ResumeBasicinfoBean setJob_experience(String job_experience) {
		this.job_experience = job_experience;
		return this;
	}
	public String getHead_shot() {
		return head_shot;
	}
	public ResumeBasicinfoBean setHead_shot(String head_shot) {
		this.head_shot = head_shot;
		return this;
	}
	public ResumeBasicinfoBean setBirthday(String birthday) {
		this.birthday = birthday;
		return this;
	}
	public String getBirthday() {
		return birthday;
	}
}
