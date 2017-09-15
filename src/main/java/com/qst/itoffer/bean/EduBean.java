package com.qst.itoffer.bean;

public class EduBean {
	private int eduid,applicantid;
	private String school,time,education,major;

	public String getSchool() {
		return school;
	}

	public EduBean setSchool(String school) {
		this.school = school;
		return this;
	}

	public String getTime() {
		return time;
	}

	public EduBean setTime(String time) {
		this.time = time;
		return this;
	}

	public String getEducation() {
		return education;
	}

	public EduBean setEducation(String education) {
		this.education = education;
		return this;
	}

	public String getMajor() {
		return major;
	}

	public EduBean setMajor(String major) {
		this.major = major;
		return this;
	}

	public int getEduid() {
		return eduid;
	}

	public EduBean setEduid(int eduid) {
		this.eduid = eduid;
		return this;
	}

	public int getApplicantid() {
		return applicantid;
	}

	public EduBean setApplicantid(int applicantid) {
		this.applicantid = applicantid;
		return this;
	}
}
