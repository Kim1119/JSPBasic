package com.simple.model;

public class MemberVO {

	/*
	 * VO클래스는 DB컬럼들을 자바 변수로 선언합니다.
	 * DB컬럼과 form태그의 name과 매칭되는 변수를 모두 선언합니다.
	 */
	private String id;
	private String pw;
	private String name;
	private String phone1;
	private String phone2;
	private String phone3;
	private String gender;
	
	//VO클래스는 기본생성자와 모든 멤버변수를 초기화하는 생성자를 선언.
	public MemberVO() {
	
	}

	public MemberVO(String id, String pw, String name, String phone1, String phone2, String phone3, String gender) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.gender = gender;
	}



	//getter, setter
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
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
