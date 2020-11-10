package com.kh.lml.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView myPage(ModelAndView mv, int uNum) {
		
		int Follow = mService.countFollowList(uNum);
		int Follower = mService.countFollowerList(uNum);
		
		mv.addObject("Follow", Follow);
		mv.addObject("Follower", Follower);
		mv.setViewName("jiman/lml_MyPage");
		
		return mv;
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

	@RequestMapping("mUpdate.do")
	public String mUpdate(Member m,Model model) {
		System.out.println("update "+m);
		int result =mService.mUpdate(m);
		if(result >0) {
			model.addAttribute("loginUser", m);
			return "redirect:Settings.do";
		}
		else {
			model.addAttribute("msg","회원 수정 실패");
			return "common/errorPage";
		}
	}

	@ResponseBody
	@RequestMapping("pwdCheck.do")
	public String pwdCheck(String pwd ,String id){
		Member m = new Member(id,pwd);
		System.out.println(m);
		int result = mService.pwdCheck(m);

		if(result >0) {
			return "fail";
		}else {
			return "ok";
		}
	}
	@RequestMapping("changePwd.do")
	public String changePwd(HttpServletRequest request,
			@RequestParam("password1")String pwd,@RequestParam("id")String id, Model model) {
		System.out.println("pwd :" + pwd);
		System.out.println("id : " + id);
		Member changeM = new Member(id,pwd);
		int result = mService.changePwd(changeM);
		
		HttpSession session = request.getSession();
		
		
		if(result>0) {
		Member m = (Member)session.getAttribute("loginUser");
		m.setUpwd(pwd);
		model.addAttribute("loginUser");
		return "redirect:Settings2.do";
		
		
		}else {
			model.addAttribute("msg","회원 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 세팅5(친구관리)
	@RequestMapping("Settings5.do")
	public ModelAndView setting5(ModelAndView mv, int uNum) {
		
		ArrayList<Member> FollowList = mService.selectFollowList(uNum);
		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);
		ArrayList<Member> BlockList = mService.selectBlockList(uNum);
		
		mv.addObject("FollowList", FollowList);
		mv.addObject("FollowerList", FollowerList);
		mv.addObject("BlockList", BlockList);
		mv.setViewName("settings/lml_Settings_5");
		
		return mv;
	}
}
