package com.kh.lml.qna.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lml.qna.dao.qnaDao;
import com.kh.lml.qna.vo.qnaBoard;

@Service("qService")
public class qnaServiceImpl implements qnaService{
	
	@Autowired
	private qnaDao qDao;
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertStylePost(qnaBoard q) {
		return qDao.insertStylePost(q);
	}
	@Override
	public int getqnum() {
		return qDao.getqnum();
	}
	@Override
	public int insertStyleHash(qnaBoard qo) {
		return qDao.insertStyleHash(qo);
	}
	@Override
	public ArrayList<qnaBoard> selectList() {
		return qDao.selectList();
	}
	@Override
	public ArrayList<qnaBoard> selectOne(int qnum) {
		return qDao.selectOne(qnum);
	}
}
