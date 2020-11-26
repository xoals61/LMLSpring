package com.kh.lml.member.model.vo;

public class ChatRoom {
	private String chatroomid;
	private String fromuser;
	private String touser;
	private String rename_profile_img;
	

	public ChatRoom(String chatroomid, String touser, String rename_profile_img) {
		super();
		this.chatroomid = chatroomid;
		this.touser = touser;
		this.rename_profile_img = rename_profile_img;
	}
	public ChatRoom(String chatroomid, String fromuser, String touser, String rename_profile_img) {
		super();
		this.chatroomid = chatroomid;
		this.fromuser = fromuser;
		this.touser = touser;
		this.rename_profile_img = rename_profile_img;
	}
	public String getChatroomid() {
		return chatroomid;
	}
	public void setChatroomid(String chatroomid) {
		this.chatroomid = chatroomid;
	}
	public String getFromuser() {
		return fromuser;
	}
	public void setFromuser(String fromuser) {
		this.fromuser = fromuser;
	}
	public String getTouser() {
		return touser;
	}
	public void setTouser(String touser) {
		this.touser = touser;
	}
	
	
	public String getRename_profile_img() {
		return rename_profile_img;
	}
	public void setRename_profile_img(String rename_profile_img) {
		this.rename_profile_img = rename_profile_img;
	}

	@Override
	public String toString() {
		return "ChatRoom [chatroomid=" + chatroomid + ", fromuser=" + fromuser + ", touser=" + touser
				+ ", rename_profile_img=" + rename_profile_img + "]";
	}
	
	
	
	
	
	
}
