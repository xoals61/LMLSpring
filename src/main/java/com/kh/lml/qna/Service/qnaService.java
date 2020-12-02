package com.kh.lml.qna.Service;

import java.util.ArrayList;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.qna.vo.qnaBoard;

public interface qnaService {

	int insertStylePost(qnaBoard q);

	int getqnum();

	int insertStyleHash(qnaBoard qo);

	ArrayList<qnaBoard> selectList();

	ArrayList<qnaBoard> selectOne(int qnum);
}
