package com.kh.lml.board.model.vo;

import java.sql.Date;

public class Board {
	private int b_num;
	private int b_user_num;
	private String b_images;
	private String b_content;
	private String b_hashtag;
	private String b_top;
	private String b_bottom;
	private String b_shoes;
	private String b_acc;
	private String b_etc;
	private String b_status;
	private Date b_date;
	private String b_profile_img;
	private int b_user_height;
	private int b_user_weight;
	private String b_user_id;
	private String b_name;
	

	private String originalFileName;
	private String renameFileName;
	
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	
	public Board() {
		super();
	}

	public Board(int b_num, int b_user_num, String b_images, String b_content, String b_hashtag, String b_top,
			String b_bottom, String b_shoes, String b_acc, String b_etc, String b_status, Date b_date,
			String originalFileName, String renameFileName) {
		super();
		this.b_num = b_num;
		this.b_user_num = b_user_num;
		this.b_images = b_images;
		this.b_content = b_content;
		this.b_hashtag = b_hashtag;
		this.b_top = b_top;
		this.b_bottom = b_bottom;
		this.b_shoes = b_shoes;
		this.b_acc = b_acc;
		this.b_etc = b_etc;
		this.b_status = b_status;
		this.b_date = b_date;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}

	public Board(int b_user_num, String b_content, String image1, String image2, String image3, String image4,
			String image5) {
		super();
		this.b_user_num = b_user_num;
		this.b_content = b_content;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public int getB_user_num() {
		return b_user_num;
	}

	public void setB_user_num(int b_user_num) {
		this.b_user_num = b_user_num;
	}

	public String getB_images() {
		return b_images;
	}

	public void setB_images(String b_images) {
		this.b_images = b_images;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_hashtag() {
		return b_hashtag;
	}

	public void setB_hashtag(String b_hashtag) {
		this.b_hashtag = b_hashtag;
	}

	public String getB_top() {
		return b_top;
	}

	public void setB_top(String b_top) {
		this.b_top = b_top;
	}

	public String getB_bottom() {
		return b_bottom;
	}

	public void setB_bottom(String b_bottom) {
		this.b_bottom = b_bottom;
	}

	public String getB_shoes() {
		return b_shoes;
	}

	public void setB_shoes(String b_shoes) {
		this.b_shoes = b_shoes;
	}

	public String getB_acc() {
		return b_acc;
	}

	public void setB_acc(String b_acc) {
		this.b_acc = b_acc;
	}

	public String getB_etc() {
		return b_etc;
	}

	public void setB_etc(String b_etc) {
		this.b_etc = b_etc;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public String getB_profile_img() {
		return b_profile_img;
	}

	public void setB_profile_img(String b_profile_img) {
		this.b_profile_img = b_profile_img;
	}

	public int getB_user_height() {
		return b_user_height;
	}

	public void setB_user_height(int b_user_height) {
		this.b_user_height = b_user_height;
	}

	public int getB_user_weight() {
		return b_user_weight;
	}

	public void setB_user_weight(int b_user_weight) {
		this.b_user_weight = b_user_weight;
	} 	

	public String getB_user_id() {
		return b_user_id;
	}

	public void setB_user_id(String b_user_id) {
		this.b_user_id = b_user_id;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	@Override
	public String toString() {
		return "Board [b_num=" + b_num + ", b_user_num=" + b_user_num + ", b_content=" + b_content + ", b_top=" + b_top
				+ ", b_bottom=" + b_bottom + ", b_shoes=" + b_shoes + ", b_acc=" + b_acc + ", b_etc=" + b_etc
				+ ", b_status=" + b_status + ", b_date=" + b_date + ", b_profile_img=" + b_profile_img
				+ ", b_user_height=" + b_user_height + ", b_user_weight=" + b_user_weight + ", image1=" + image1
				+ ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4 + ", image5=" + image5 + "]";
	}
	
	

	
	
}
