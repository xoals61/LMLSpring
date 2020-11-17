package com.kh.lml.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
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
	
	@RequestMapping("Settings5_woo.do")
	public ModelAndView Settings5_woo(ModelAndView mv, int uNum) {

		ArrayList<Member> FollowList = mService.selectFollowList(uNum);
		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);
		ArrayList<Member> BlockList = mService.selectBlockList(uNum);

		mv.addObject("FollowList", FollowList);
		mv.addObject("FollowerList", FollowerList);
		mv.addObject("BlockList", BlockList);
		mv.setViewName("settings/lml_Settings_5_woo");

		return mv;
	}
	
	@RequestMapping("Settings5_block.do")
	public ModelAndView Settings5_block(ModelAndView mv, int uNum) {

		ArrayList<Member> FollowList = mService.selectFollowList(uNum);
		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);
		ArrayList<Member> BlockList = mService.selectBlockList(uNum);

		mv.addObject("FollowList", FollowList);
		mv.addObject("FollowerList", FollowerList);
		mv.addObject("BlockList", BlockList);
		mv.setViewName("settings/lml_Settings_5_block");

		return mv;
	}

	// 팔로우 등록
	@ResponseBody
	@RequestMapping(value="followBtn.do")
	public String followBtn(int toFollow, int fromFollow) {

		Member f = new Member(fromFollow, toFollow);

		int result = mService.followBtn(f);

		//int result = mService.followBtn(f);

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

	// 팔로우추가 뷰 -> 팔로우 리스트 업데이트
	@RequestMapping(value="updateFollowList.do", produces="application/json; charset=UTF-8")
	public void updateFollowList(HttpServletResponse response, int uNum) throws JsonIOException, IOException {

		ArrayList<Member> updateList = mService.selectFollowList(uNum);
		response.setContentType("application/json; charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(updateList, response.getWriter());
	}

	// 언팔로우 등록

	@ResponseBody
	@RequestMapping(value="unfollowBtn.do") 
	public String unfollowBtn(int toUnFollow, int fromFollow) {

		Member f = new Member(fromFollow, toUnFollow);

		int result = mService.unfollowBtn(f);

		if(result > 0) {
			return "success"; 
		}else { 
			return "fail"; 
		} 


	}

	//1113은지
	// 검색페이지
	@RequestMapping("Search.do")
	public ModelAndView Search(ModelAndView mv, String keyword) {

		// ArrayList<Member> SearchBoard = mService.searchBoardList(keyword);
		ArrayList<Member> SearchUser = mService.searchUserList1(keyword);
		int userCount = mService.searchUserCount(keyword);
		// 6명만 나옴. 
		// 회원번호, 사진, 아이디, 이름, 팔로우 여부(팔로우 했으면 X, 팔로우 아니면 팔로우 버튼 나오게) -팔로우 버튼 눌렀을 시 팔로우.do
		// 팔로우 여부는 ajax로 하자..

		System.out.println("검색 : " + userCount);

		mv.addObject("searchUser", SearchUser);
		mv.addObject("userCount",userCount);

		mv.setViewName("search/lml_search");

		return mv;
	}

	// 검색페이지 팔로우 리스트용   
	@RequestMapping(value="searchFollowList.do", produces="application/json; charset=UTF-8")
	public void searchFollowList(HttpServletResponse response, int uNum) throws JsonIOException, IOException {

		ArrayList<Member> FollowList = mService.selectFollowList(uNum);
		response.setContentType("application/json; charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(FollowList,response.getWriter());
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
	//1113은지



	@RequestMapping("mDelete.do")
	public String mDelete(String id,Model model) {
		
		int result = mService.mDelete(id);
		
		if(result>0) {

			return "redirect:logout.do";
		}else{
			model.addAttribute("msg","회원 탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	
}
