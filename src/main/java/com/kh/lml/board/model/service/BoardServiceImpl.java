package com.kh.lml.board.model.service;

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
	
	@Override
	public int insertStylePost(Board b) {
		return bDao.insertStylePost(b);
	}

	@Override
	public int TestMultipart(Board b) {
		return bDao.TestMultipart(b);

	}
}
