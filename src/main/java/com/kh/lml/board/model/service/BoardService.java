package com.kh.lml.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.board.model.vo.Comment;

public interface BoardService {

	int insertStylePost(Board b);

	int TestMultipart(Board b);

	ArrayList<Board> selectList();

	ArrayList<Board> selectOne(int bnum);

	int getbnum();

	int insertStyleHash(Board bo);

	ArrayList<String> selectHash(int bnum);

	ArrayList<Comment> selectComment(int bnum);

	int addComment(Comment cm);

	int addHeart(Board b);

	ArrayList<Comment> boardHeartList(int unum);

	int deleteHeart(Board b);

	ArrayList<Board> getDetailHeart(int bnum);



}
