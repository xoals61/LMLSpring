package com.kh.lml.board.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonIOException;
import com.kh.lml.board.model.service.JM_BoardService;
import com.kh.lml.board.model.vo.Board;
@SessionAttributes("loginUser")
@Controller

public class JM_BoardController {
	
	@Autowired
	private JM_BoardService jService;
	


	@ResponseBody
	@RequestMapping(value="followingpost.do", produces="application/json; charset=UTF-8")
		public String followingpost(HttpServletResponse response,int usernum) throws JsonIOException, JsonProcessingException{
			
		System.out.println("유저넘:" + usernum);
		 
		ArrayList<Board> list = jService.followingpost(usernum);
			
			
			System.out.println("되어라되어라: "+ list);
			ObjectMapper mapper = new ObjectMapper();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			mapper.setDateFormat(sdf);
			
			String jsonStr = mapper.writeValueAsString(list);
			
			return jsonStr;
		}
}
