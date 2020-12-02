package com.kh.lml.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lml.board.model.dao.BoardDao;
import com.kh.lml.board.model.vo.Board;
import com.kh.lml.board.model.vo.Comment;
import com.kh.lml.member.model.vo.Member;

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

	@Override
	public ArrayList<String> selectHash(int bnum) {
		return bDao.selectHash(bnum);
	}

	@Override
	public ArrayList<Comment> selectComment(int bnum) {
		return bDao.selectComment(bnum);
	}

	@Override
	public int addComment(Comment cm) {
		return bDao.addComment(cm);
	}

	@Override
	public int addHeart(Board b) {
		return bDao.addHeart(b);
	}

	@Override
	public ArrayList<Comment> boardHeartList(int unum) {
		return bDao.boardHeartList(unum);
	}

	@Override
	public int deleteHeart(Board b) {
		return bDao.deleteHeart(b);
	}

	@Override
	public ArrayList<Board> getDetailHeart(int bnum) {
		return bDao.getDetailHeart(bnum);
	}

	@Override
	public int deleteComment(int cno) {
		return bDao.deleteComment(cno);
	}

	@Override
	public int getFollowList(Member m) {
		return bDao.getFollowList(m);
	}

	@Override
	public int getTagUserNum(String tagUser) {
		return bDao.getTagUserNum(tagUser);
	}

	@Override
	public int insertTagUser(Board bo) {
		return bDao.insertTagUser(bo);
	}




	 
}
