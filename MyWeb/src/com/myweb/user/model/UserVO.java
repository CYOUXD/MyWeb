package com.myweb.user.model;//6

import java.sql.Timestamp;

public class UserVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String address;
	private Timestamp regdate; //회원가입 시간, 회원정보 수정 시간
	
	public UserVO() {}

	public UserVO(String id, String pw, String name, String email, String address, Timestamp regdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.address = address;
		this.regdate = regdate;
	}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String addr) {
		this.address = addr;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	};
	
	
}
