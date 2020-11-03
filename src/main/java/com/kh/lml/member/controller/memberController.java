package com.kh.lml.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {
	@RequestMapping("MyPage.do")
	public String myPage() {
		return "jiman/MyPage";
	}
	@RequestMapping("login.do")
	public String login() {
		return "jiman/login";
	}
	@RequestMapping("Settings.do")
	public String setting() {
		return "settings/lml_Settings";
	}
	@RequestMapping("Settings2.do")
	   public String setting2() {
	      return "settings/lml_Settings_2";
	   }
	   @RequestMapping("Settings3.do")
	   public String setting3() {
	      return "settings/lml_Settings_3";
	   }
	   @RequestMapping("Settings4.do")
	   public String setting4() {
	      return "settings/lml_Settings_4";
	   }
	   @RequestMapping("Settings5.do")
	   public String setting5() {
	      return "settings/lml_Settings_5";
	   }
	@RequestMapping("Index.do")
	public String index() {
		return "../../index";
	}
}
