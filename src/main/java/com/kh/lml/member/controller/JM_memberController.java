package com.kh.lml.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.member.model.service.MemberService;
import com.kh.lml.member.model.vo.Member;

@Controller
public class JM_memberController {
	@Autowired
	private MemberService mService;

	@ResponseBody
	@RequestMapping("werlist.do")
	private ArrayList<Member> werlist(String id) {
		int uNum = mService.finduNum(id);
		System.out.println("werlist" + uNum);

		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);
		ArrayList<Integer> couple = mService.coupleFind(uNum);
		System.out.println(couple);
		
		for(Member a : FollowerList) {
			a.setBtn("button2");
			for(int b : couple) {
				if(a.getFrom_follower()== b) {
					a.setBtn("button1");
				}
				
				
			}

		}
		
		
		
		for (Member a : FollowerList) {
			System.out.println("여기 팔로워 리스트"+a);

		}
		return FollowerList;

	}

	@ResponseBody
	@RequestMapping("woolist.do")
	private ArrayList<Member> woolist(String id) {
		int uNum = mService.finduNum(id);
		System.out.println("woolist" + uNum);

		ArrayList<Member> FollowooList = mService.selectFollowList(uNum);
		
		ArrayList<Integer> couple = mService.coupleFind(uNum);
		System.out.println(couple);
		
		for(Member a : FollowooList) {
			a.setBtn("button1");
			

		}
		
		
		
		
		
		for (Member a : FollowooList) {
			System.out.println(a);

		}
		return FollowooList;
	}

	@RequestMapping("userPage.do")
	private String userPage(String id, Model model) {
		Member m = mService.userPage(id);
		System.out.println(m + "여기 유저 찾는곳?");
		
		
		
		int uNum = mService.finduNum(id);
		int Follow = mService.countFollowList(uNum);
		int Follower = mService.countFollowerList(uNum);
		ArrayList<Board> list = mService.myPost(uNum);
		int boardCount =mService.boardCount(uNum);


		if (m != null) {
			model.addAttribute("Userboardlist", list);
			model.addAttribute("User", m);
			model.addAttribute("Follow", Follow);
			model.addAttribute("Follower", Follower);
			model.addAttribute("boardCount", boardCount);
			return "jiman/lml_UserPage";
		} else {
			model.addAttribute("msg", "바보야 유저 없다");
			return "common/errorPage";
		}

	}


	@RequestMapping("SearchUser.do") 
	public ModelAndView Search(ModelAndView mv,String keyword) {
		System.out.println("키워드는?"+ keyword);
		// ArrayList<Member> SearchBoard = mService.searchBoardList(keyword);
		ArrayList<Member> SearchUser = mService.searchUserList1(keyword); 
		int userCount = mService.searchUserCount(keyword);
		System.out.println("이름검색 : " +userCount);

		mv.addObject("searchUser", SearchUser); 
		mv.addObject("userCount",userCount);

		mv.setViewName("search/lml_search_user");

		return mv; 

	}


	@RequestMapping("toMessage.do")
	public String toMessage(String toid, String fromid,Model model) {
		System.out.println("toid?: "+toid +", from?: "+fromid);
		Map<String, String> map = new HashMap<String, String>();
		map.put("toid",toid);
		map.put("fromid",fromid);
		map.put("newroomid",toid+fromid);
		String chatRoom =mService.findRoom(map);
		System.out.println("챗룸"+chatRoom);
		
		if(chatRoom != null) {
			return "redirect:Message.do?id=" + fromid;
		}else {
			int result = mService.newRoom(map);
			if(result > 1) {
				
				return "redirect:Message.do?id=" + fromid;
			}
			else {
			model.addAttribute("msg","잘못");
			
			return "common/errorPage";
			}
		}
		
		
	}
	
	
	
	@RequestMapping("Search.do")
	public ModelAndView Search1(ModelAndView mv, String keyword) {

		// ArrayList<Member> SearchBoard = mService.searchBoardList(keyword);
		ArrayList<Member> SearchUser = mService.searchUserList1(keyword);
		ArrayList<Member> tagPost = mService.tagList1(keyword);
		int userCount = mService.searchUserCount(keyword);
		int tagCount = mService.searchtagCount(keyword);
		// 6명만 나옴. 
		// 회원번호, 사진, 아이디, 이름, 팔로우 여부(팔로우 했으면 X, 팔로우 아니면 팔로우 버튼 나오게) -팔로우 버튼 눌렀을 시 팔로우.do
		// 팔로우 여부는 ajax로 하자..

		System.out.println("검색 : " + userCount);

		mv.addObject("searchUser", SearchUser);
		System.out.println(SearchUser);
		mv.addObject("userCount",userCount);
		mv.addObject("keyword", keyword);
		mv.addObject("tagpost", tagPost);
		mv.addObject("tagCount", tagCount);
		mv.setViewName("search/lml_search");

		return mv;
	}



}
