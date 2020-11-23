package com.kh.lml.board.model.service;

import java.util.ArrayList;

import com.kh.lml.board.model.vo.Board;

public interface BoardService {

	int insertStylePost(Board b);

	int TestMultipart(Board b);

	ArrayList<Board> selectList();

}
