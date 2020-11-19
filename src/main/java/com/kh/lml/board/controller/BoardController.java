package com.kh.lml.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.lml.board.model.service.BoardService;
import com.kh.lml.board.model.vo.Board;

@SessionAttributes("loginUser")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("stylePostUpload.do")
	public String insertStylePost(Board b, HttpServletRequest request,
									@RequestParam(name="bUploadImg", required=false) MultipartFile file) {

		System.out.println(file.getOriginalFilename());
		
		if(!file.getOriginalFilename().equals("")) {
			
			// 서버에 업로드 해야한다.
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) { // 파일이 잘 저장된 경우
				b.setOriginalFileName(file.getOriginalFilename()); // 파일명만 DB에저장
				b.setRenameFileName(renameFileName);
			}
		}
		
		int result = bService.insertStylePost(b);
		
		if(result > 0) {
			System.out.println("글쓰기 성공");
			return null;
		}else {
			System.out.println("글쓰기 실패");
			return null;
		}
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로를 설정하기
		// 웹 서버의 contextPath를 불러와서 폴더의 경로를 가져온다
		// webapp하위의 resources
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root : " + root);
		
		// 파일 경로
		// \를 문자로 인식시키기 위해서는 "\\"를 사용한다.
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) { // 폴더가 있는지 없는지
			folder.mkdirs(); // 폴더가 없다면 생성한다.
		}
		
		// 파일명을 rename 과정을 추가 => "년월일시분초.확장자"로 변경
		String originalFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
		
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
							  + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" + renameFileName; // 실제 저장될 파일 경로 + 파일명
		
		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이 때 파일이 저장된다.
		}catch(Exception e) {
			System.out.println("파일 전송 에러" + e.getMessage());
		}
		
		return renameFileName;
	}
	
	
}
