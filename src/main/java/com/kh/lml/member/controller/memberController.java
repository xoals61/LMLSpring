package com.kh.lml.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {
	@RequestMapping("MyPage.do")
	public String myPage() {
		return "jiman/MyPage";
	}
}
