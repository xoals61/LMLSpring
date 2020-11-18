package com.kh.lml.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		System.out.println("werlist" +uNum);
		
		
		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);
		for(Member a : FollowerList) {
			System.out.println(a);
			
		}
			return FollowerList;
		
		
		
		
		
		
	}
	
	
}
