package com.test1234.vo;

public class UserVO {
	String id;
	String pw;
	String name;
	String nname;
	String radio1;
	String cb;
	String radio2;
	String sns;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getRadio1() {
		return radio1;
	}

	public void setRadio1(String radio1) {
		this.radio1 = radio1;
	}

	public String getCb() {
		return cb;
	}

	public void setCb(String cb) {
		this.cb = cb;
	}

	public String getRadio2() {
		return radio2;
	}

	public void setRadio2(String radio2) {
		this.radio2 = radio2;
	}

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", name=" + name + ", nname=" + nname + ", radio1=" + radio1
				+ ", cb=" + cb + ", radio2=" + radio2 + ", SNS=" + sns + "]";

	}

}
