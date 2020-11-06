package com.kh.lml.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.lml.member.model.service.MemberService;
import com.kh.lml.member.model.vo.Member;


@SessionAttributes("loginUser") // Model에 loginUser라는 키값으로 객체가 추가되면 자동으로 세션에추가하라는 의미의 어노테이션
@Controller
public class memberController {

	@Autowired
	private MemberService mService;


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
	/**
	 * 아이디 중복체크
	 *  @ResponseBody를사용
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id){
		System.out.println(id);
		int result = mService.idCheck(id);
		
		if(result > 0) { // 중복 존재
			return "fail";
		}else {
			return "ok";
		}
	}
	
	@ResponseBody
	@RequestMapping("nameCheck.do")
	public String nameCheck(String name) {
		System.out.println(name);
		int result = mService.nameCheck(name);
		
		if(result >0) {
			return "fail";
		}else {
			return "ok";
		}
		
		
	}
	
	// 글쓰기
	@RequestMapping("Post.do")
	public String Post() {
		return "post/lml_post";
	}

	@RequestMapping("mInsert.do")
	public String mInsert(Member m,Model model) {
		System.out.println(m);
		int result = mService.insertMember(m);
		if(result>0) {
			return "redirect:login.do";
		}
		else {
			model.addAttribute("msg","회원가입실패");
			return "common/errorpage";
		}

	}
	
	@RequestMapping(value="mLogin.do",method=RequestMethod.POST)
	public String mLogin(Member m,Model model,HttpSession session) {
		System.out.println(m);
		Member loginUser = mService.loginMember(m);
		System.out.println(loginUser);
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:Index.do";

		}else {
			model.addAttribute("msg","로그인 실패!");
			return "common/errorPage";
		}



	}
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		
		// 세션의 상태를 확정지어주는 메소드 호출이 필요하다
		status.setComplete();
		return "redirect:Index.do";
	}
}
