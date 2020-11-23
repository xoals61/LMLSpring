package com.kh.lml.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		
		if(result > 0) {
			System.out.println("글쓰기 성공");
			return "../../index";
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
	

	@RequestMapping("styleQnaUpload.do")
	public String TestMultipart(Board b, MultipartHttpServletRequest request) {
		List<MultipartFile> fileList = request.getFiles("file");
		
		String[] renameFileList = new String[5];
		
		for(int i = 0; i < fileList.size(); i++) {
			
			// 서버에 업로드 해야한다.
			String renameFileName = saveFile(fileList.get(i),request);
				
			if(renameFileName != null) { // 파일이 잘 저장된 경우
				b.setOriginalFileName(fileList.get(i).getOriginalFilename()); // 파일명만 DB에저장
				b.setRenameFileName(renameFileName);
				
				renameFileList[i] = renameFileName;
				
			}
		}
		
		b.setImage1(renameFileList[0]);
		b.setImage2(renameFileList[1]);
		b.setImage3(renameFileList[2]);
		b.setImage4(renameFileList[3]);
		b.setImage5(renameFileList[4]);
		
		int result = bService.TestMultipart(b);
		
		if(result > 0) {
			System.out.println("글쓰기 성공");
			return null;
		}else {
			System.out.println("글쓰기 실패");
			return null;
		}


	}
	
	
	// 인덱스 메인
//	@ResponseBody
//	@RequestMapping(value="Index.do", produces="application/json; charset=UTF-8")
//	public String index(HttpServletResponse response) throws JsonIOException, JsonProcessingException{
//		
//		ArrayList<Board> list = bService.selectList();
//		
//		ObjectMapper mapper = new ObjectMapper();
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		mapper.setDateFormat(sdf);
//		
//		String jsonStr = mapper.writeValueAsString(list);
//		
//		return jsonStr;
//	}
	@RequestMapping("Index.do")
	public ModelAndView index(ModelAndView mv) {
		
		ArrayList<Board> list = bService.selectList();
		
		mv.addObject("boardList", list);
		mv.setViewName("../../index");
		
		return mv;
	}
	

	
}
