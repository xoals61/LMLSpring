package com.kh.lml.board.controller;

import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonIOException;
import com.kh.lml.board.model.service.BoardService;
import com.kh.lml.board.model.vo.Board;
import com.kh.lml.board.model.vo.Comment;
import com.kh.lml.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("stylePostUpload.do")
	public String insertStylePost(Board b, MultipartHttpServletRequest request,
			@RequestParam(value="bUploadImg1", required=false) MultipartFile file1,
			@RequestParam(value="bUploadImg2", required=false) MultipartFile file2,
			@RequestParam(value="bUploadImg3", required=false) MultipartFile file3,
			@RequestParam(value="bUploadImg4", required=false) MultipartFile file4,
			@RequestParam(value="bUploadImg5", required=false) MultipartFile file5) {	
		
		MultipartFile[] fileList = {file1,file2,file3,file4,file5};
		
		String[] renameFileList = new String[5];
		
		for(int i = 0; i < fileList.length; i++) {
			if(!fileList[i].getOriginalFilename().equals("")) {
				String renameFileName = saveFile(fileList[i],request);
					
				if(renameFileName != null) { 
					b.setOriginalFileName(fileList[i].getOriginalFilename());
					b.setRenameFileName(renameFileName);
					
					renameFileList[i] = renameFileName;
					
				}else {
					renameFileList[i] = null;
				}
			}
		}
		
		b.setImage1(renameFileList[0]);
		b.setImage2(renameFileList[1]);
		b.setImage3(renameFileList[2]);
		b.setImage4(renameFileList[3]);
		b.setImage5(renameFileList[4]);
		
		int result = bService.insertStylePost(b);
		int getbnum = bService.getbnum();
		
		String b_hash =b.getB_hash();
		//System.out.println("1. b_hash는 : " + b_hash);
		
		String[] slist = b_hash.split(",");
		//System.out.println("2. slist는 : " + slist);
		
		if(b_hash.length() > 0) {
			for(int i=0; i<slist.length; i++){
				Board bo = new Board();
				bo.setB_num(getbnum);
				bo.setB_hash(slist[i].toString());
				 
				int res = bService.insertStyleHash(bo);
			}
		}
		
		String tagUser = b.getT_unum();
		//System.out.println("3. tagUser는 : " + tagUser);
		String[] tagUserArr = tagUser.split(",");
		//System.out.println("4. tagUserArr는 : " + Integer.parseInt(tagUserArr[0].toString()));
		
        //System.out.println("4. tagUserArr는 : " + tagUserArr);
        
		if(tagUser.length() > 0) {
			for(int i=0; i<tagUserArr.length; i++){
				Board bo = new Board();
				bo.setT_bnum(getbnum);
				bo.setT_tagUnum(Integer.parseInt(tagUserArr[i].toString()));
				
				int res = bService.insertTagUser(bo);
			}
		}
		
		
		if(result > 0) {
			System.out.println("글쓰기 성공");
			/* return "../../index"; */
			return "redirect:/index.do";
		}else {
			System.out.println("글쓰기 실패");
			return "../../index";
			
		}
		
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) { // 폴더가 있는지 없는지
			folder.mkdirs(); // 폴더가 없다면 생성한다.
		}
		
		// 파일명을 rename 과정을 추가 => "년월일시분초.확장자"로 변경
		String originalFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss"); 
		
		String renameFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
							  + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" + renameFileName; // 실제 저장될 파일 경로 + 파일명
		
		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이 때 파일이 저장된다.
		}catch(Exception e) {
			System.out.println("파일 전송 에러" + e.getMessage());
		}
		
		return renameFileName;
	}
	

	
	
	
	@GetMapping(path ="/index")
	public String index1() {
		return "redirect:/";
		
	}
	
	@RequestMapping("Index.do")
	public String index() {
		return "../../index";
	}
	
	// 인덱스 메인
	@ResponseBody
	@RequestMapping(value="IndexAjax.do", produces="application/json; charset=UTF-8")
	public String index1(HttpServletResponse response) throws JsonIOException, JsonProcessingException{
		
		ArrayList<Board> list = bService.selectList();
		
		ObjectMapper mapper = new ObjectMapper();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mapper.setDateFormat(sdf);
		
		String jsonStr = mapper.writeValueAsString(list);
		
		return jsonStr;
	}
	
	// 디테일
	@ResponseBody
	@RequestMapping(value="BoardDetail.do", produces="application/json; charset=UTF-8")
	public String boardDetail(HttpServletResponse response, int bnum) throws JsonIOException, JsonProcessingException{
		
		ArrayList<Board> list = bService.selectOne(bnum);
		
		ObjectMapper mapper = new ObjectMapper();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mapper.setDateFormat(sdf);
		
		String jsonStr = mapper.writeValueAsString(list);
		System.out.println("나 여기 보드 디테일쩜 두 다 ::"+"list");
		return jsonStr;
	}
	
	// 디테일 해쉬태그 불러오기
	@ResponseBody
	@RequestMapping(value="BoardDetailHash.do", produces="application/json; charset=UTF-8")
	public String BoardDetailHash(HttpServletResponse response, int bnum) throws JsonIOException, JsonProcessingException{
		
		ArrayList<String> list = bService.selectHash(bnum);
		
		ObjectMapper mapper = new ObjectMapper();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mapper.setDateFormat(sdf);
		
		String jsonStr = mapper.writeValueAsString(list);
		
		return jsonStr;
	}
	//사용자 태그 가져오기
	@ResponseBody
	@RequestMapping(value="UserDetailHash.do", produces="application/json; charset=UTF-8")
	public String UserDetailHash(HttpServletResponse response, int bnum) throws JsonIOException, JsonProcessingException{
		System.out.println("여기컨트롤러리스트" +bnum); //1063
		ArrayList<String> list = bService.UserHash(bnum);
		System.out.println("여기컨트롤러리스트"+list);
		ObjectMapper mapper = new ObjectMapper();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mapper.setDateFormat(sdf);
		
		String wow = mapper.writeValueAsString(list);
		
		return wow;
	}
	
	// 디테일 댓글 불러오기
	@ResponseBody
	@RequestMapping(value="BoardDetailComm.do", produces="application/json; charset=UTF-8")
	public String BoardDetailComm(HttpServletResponse response, int bnum) throws JsonIOException, JsonProcessingException{
		
		ArrayList<Comment> list = bService.selectComment(bnum);
		
		ObjectMapper mapper = new ObjectMapper();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mapper.setDateFormat(sdf);
		
		String jsonStr = mapper.writeValueAsString(list);
		
		return jsonStr;
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="BoardComment.do")
	public String BoardComment(String comment, int unum, int bnum) {
	
		Comment cm = new Comment(bnum, comment, unum);
	
		int result = bService.addComment(cm);
	
		//int result = mService.followBtn(f);
	
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="CommentDelete.do")
	public String CommentDelete(int cno) {
	
		int result = bService.deleteComment(cno);
	
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 좋아요 등록
	@ResponseBody
	@RequestMapping(value="BoardAddHeart.do")
	public String BoardAddHeart(int bnum, int unum) {
	
		Board b = new Board(bnum, unum);
	
		int result = bService.addHeart(b);
	
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 좋아요 취소
	@ResponseBody
	@RequestMapping(value="BoardDelHeart.do")
	public String BoardDelHeart(int bnum, int unum) {
	
		Board b = new Board(bnum, unum);
	
		int result = bService.deleteHeart(b);
	
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
		

	// 좋아요 불러오기
	@ResponseBody
	@RequestMapping(value="BoardHeart.do", produces="application/json; charset=UTF-8")
	public String BoardHeart(HttpServletResponse response, int unum) throws JsonIOException, JsonProcessingException{
		
		ArrayList<Comment> list = bService.boardHeartList(unum);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(list);
		
		return jsonStr;
	}
	
	// 좋아요 불러오기
	@ResponseBody
	@RequestMapping(value="BoardDetailHeart.do", produces="application/json; charset=UTF-8")
	public String BoardDetailHeart(HttpServletResponse response, int bnum) throws JsonIOException, JsonProcessingException{
		
		ArrayList<Board> list = bService.getDetailHeart(bnum);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(list);
		
		return jsonStr;
	}
	
	// 팔로우 했는지 불러오기
	@ResponseBody
	@RequestMapping(value="BoardDetailFollowList.do", produces="application/json; charset=UTF-8")
	public int BoardDetailFollowList(int unum, int bunum) throws JsonIOException, JsonProcessingException{
		
		Member m = new Member(unum, bunum);
		
		int res = bService.getFollowList(m);
		
		return res;
	}
	
	// 글쓰기 사용자태그 부분 사용자 있는지 없는지 확인
	@ResponseBody
	@RequestMapping(value="getTagUserNum.do", produces="application/json; charset=UTF-8")
	public int getTagUserNum(String tagUser) throws JsonIOException, JsonProcessingException{
		
		System.out.println("여기컨트롤러태그유저: "+tagUser);
		int res = bService.getTagUserNum(tagUser);
		
		
			return res;
		
	}
	

	
}
