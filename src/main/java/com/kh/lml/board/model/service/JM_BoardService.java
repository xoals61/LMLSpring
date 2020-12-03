package com.kh.lml.board.model.service;

import java.util.ArrayList;

import com.kh.lml.board.model.vo.Board;
public interface JM_BoardService {


	ArrayList<Board> followingpost(int usernum);

	ArrayList<Board> bodySelect();
	
}
