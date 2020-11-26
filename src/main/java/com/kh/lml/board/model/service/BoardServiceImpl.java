package com.kh.lml.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lml.board.model.dao.BoardDao;
import com.kh.lml.board.model.vo.Board;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 포스트 업로드
	@Override
	public int insertStylePost(Board b) {
		return bDao.insertStylePost(b);
	}

	// 업로드 테스트용
	@Override
	public int TestMultipart(Board b) {
		return bDao.TestMultipart(b);

	}

	// 전체 글 리스트
	@Override
	public ArrayList<Board> selectList() {
		return bDao.selectList();
	}

	// 디테일
	@Override
	public ArrayList<Board> selectOne(int bnum) {
		return bDao.selectOne(bnum);
	}

	@Override
	public int getbnum() {
		return bDao.getbnum();
	}

	@Override
	public int insertStyleHash(Board bo) {
		return bDao.insertStyleHash(bo);
	}




	 
}
