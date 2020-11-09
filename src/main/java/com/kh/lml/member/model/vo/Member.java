package com.kh.lml.member.model.vo;

public class Member {
	private String id;
	private String mail;
	private String upwd;
	private int m_phone;
	private int height;
	private int weight;
	private char gender;
	private String uname;
	private String intro;
	private String profile_img;
	private int user_num;
//	gdENs
	public Member() {
		super();
	}
	
	
	
	public Member(String id, String mail, String upwd, int m_phone, int height, int weight, char gender, String uname) {
		super();
		this.id = id;
		this.mail = mail;
		this.upwd = upwd;
		this.m_phone = m_phone;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
		this.uname = uname;
	}





	public Member(String id, String mail, String upwd, int m_phone, int height, int weight, char gender, String uname,
			String intro, String profile_img, int user_num) {
		super();
		this.id = id;
		this.mail = mail;
		this.upwd = upwd;
		this.m_phone = m_phone;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
		this.uname = uname;
		this.intro = intro;
		this.profile_img = profile_img;
		this.user_num = user_num;
	}


	//비밀번호 체크용
	public Member(String id, String upwd) {
		super();
		this.id = id;
		this.upwd = upwd;
	}



	public String getProfile_img() {
		return profile_img;
	}



	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}



	public int getUser_num() {
		return user_num;
	}



	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getMail() {
		return mail;
	}



	public void setMail(String mail) {
		this.mail = mail;
	}



	public String getUpwd() {
		return upwd;
	}



	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}



	public int getM_phone() {
		return m_phone;
	}



	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}



	public int getHeight() {
		return height;
	}



	public void setHeight(int height) {
		this.height = height;
	}



	public int getWeight() {
		return weight;
	}



	public void setWeight(int weight) {
		this.weight = weight;
	}



	public char getGender() {
		return gender;
	}



	public void setGender(char gender) {
		this.gender = gender;
	}



	public String getUname() {
		return uname;
	}



	public void setUname(String uname) {
		this.uname = uname;
	}



	public String getIntro() {
		return intro;
	}



	public void setIntro(String intro) {
		this.intro = intro;
	}



	@Override
	public String toString() {
		return "Member [id=" + id + ", mail=" + mail + ", upwd=" + upwd + ", m_phone=" + m_phone + ", height=" + height
				+ ", weight=" + weight + ", gender=" + gender + ", uname=" + uname + ", intro=" + intro
				+ ", profile_img=" + profile_img + ", user_num=" + user_num + "]";
	}


	
}
