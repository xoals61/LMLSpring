package com.kh.lml.board.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonIOException;
import com.kh.lml.board.model.service.JM_BoardService;
import com.kh.lml.board.model.vo.Board;
import com.kh.lml.member.model.vo.Member;
@SessionAttributes("loginUser")
@Controller

public class JM_BoardController {
	
	@Autowired
	private JM_BoardService jService;
	

	@RequestMapping("followingpost.do") 
	public String index(HttpServletRequest request,Model model) {
		/*
		 * Member m =(Member) request.getAttribute("loginUser"); int usernum =
		 * m.getUser_num();
		 */
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		model.addAttribute("usernum",m.getUser_num());
		
		
		return "indexPost/followpost";
	}

	@ResponseBody
	@RequestMapping(value="followingpostAjax.do", produces="application/json; charset=UTF-8")
		public String followingpost(HttpServletRequest request, @RequestParam(value="usernum", required=false) int usernum) throws JsonIOException, JsonProcessingException{
	
	

		 
		ArrayList<Board> list = jService.followingpost(usernum);
			
		
			for(Board b : list) {
				System.out.println("되어라되어라: "+ b);	
			}
			
			
			ObjectMapper mapper = new ObjectMapper();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			mapper.setDateFormat(sdf);
			
			String jsonStr = mapper.writeValueAsString(list);
			
			return jsonStr;
		}
	
}
