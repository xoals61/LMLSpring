package com.kh.lml.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {
	// 인덱스 메인
	@RequestMapping("Index.do")
		public String index() {
			return "../../index";
	}
	// 로그아웃(임시로 만들어놓음)
	@RequestMapping("Logout.do")
	public String Logout() {
		return "logout/lml_logout";
	}
	// 로그인페이지
	@RequestMapping("login.do")
		public String login() {
			return "jiman/lml_login";
	}
	// 마이페이지
	@RequestMapping("MyPage.do")
	public String myPage() {
		return "jiman/lml_MyPage";
	}
	// 세팅(정보수정)
	@RequestMapping("Settings.do")
	public String setting() {
		return "settings/lml_Settings";
	}
	// 세팅2(비번수정)	
	@RequestMapping("Settings2.do")
	   public String setting2() {
	      return "settings/lml_Settings_2";
	}
	// 세팅3(이메일문의)
	@RequestMapping("Settings3.do")
	   public String setting3() {
	      return "settings/lml_Settings_3";
	}
	// 세팅4(탈퇴)
	@RequestMapping("Settings4.do")
	   public String setting4() {
	      return "settings/lml_Settings_4";
	}
	// 세팅5(친구관리)
	@RequestMapping("Settings5.do")
	   public String setting5() {
	      return "settings/lml_Settings_5";
	}
	// 검색페이지
	@RequestMapping("Search.do")
	   public String Search() {
	      return "search/lml_search";
	}
	// 검색(해쉬태그)
	@RequestMapping("SearchHash.do")
	   public String SearchHash() {
	      return "search/lml_search_hashtag";
	}
	// 검색(사용자)
	@RequestMapping("SearchUser.do")
	   public String SearchUser() {
	      return "search/lml_search_user";
	}
	// 채팅
	@RequestMapping("Message.do")
		public String Message() {
			return "message/lml_message";
	}
	// 글쓰기
	@RequestMapping("Post.do")
	public String Post() {
		return "post/lml_post";
	}
	
}
