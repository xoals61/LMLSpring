package com.kh.lml.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lml.board.model.vo.Board;

@Repository("bDao")
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 포스트 업로드
	public int insertStylePost(Board b) {
		return sqlSession.insert("boardMapper.insertStylePost", b);
	}

	// 업로드 테스트용
	public int TestMultipart(Board b) {
		return sqlSession.insert("boardMapper.testMultipart", b);
	}

	// 전체 글 리스트
	public ArrayList<Board> selectList() {
		return (ArrayList)sqlSession.selectList("boardMapper.selectList");
	}

	public ArrayList<Board> selectOne(int bnum) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectOne",bnum);
	}

}
