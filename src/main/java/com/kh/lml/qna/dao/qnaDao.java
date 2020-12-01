package com.kh.lml.qna.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.qna.vo.qnaBoard;

@Repository("qDao")
public class qnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertStylePost(qnaBoard q) {
		return sqlSession.insert("qnaMapper.insertQnaPost", q);
	}

	public int getqnum() {
		return sqlSession.selectOne("qnaMapper.getqnum");
	}

	public int insertStyleHash(qnaBoard qo) {
		return sqlSession.insert("qnaMapper.insertStyleHash", qo);
	}

	public ArrayList<Board> selectList() {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList");
	}
}
