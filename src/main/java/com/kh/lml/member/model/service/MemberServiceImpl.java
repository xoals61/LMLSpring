package com.kh.lml.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lml.member.model.vo.ChatLog;
import com.kh.lml.member.model.vo.ChatRoom;
import com.kh.lml.member.model.vo.Member;
import com.kh.lml.board.model.vo.Board;
import com.kh.lml.member.model.dao.MemberDao;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao mDao;
	
	
	

	@Autowired
	SqlSessionTemplate sqlSession; // 트랜잭션 처리용
	
	//회원가입
	@Override
	public int insertMember(Member m) {
		int result = mDao.insertMember(m);
		
		return result;
	}

	//아이디 중복체크
	@Override
	public int idCheck(String id) {
	return mDao.idCheck(id);
	}

	@Override
	public Member loginMember(Member m) {
		
		return mDao.loginMember(m);
	}

	@Override
	public int nameCheck(String name) {
		
		return mDao.nameCheck(name);
	}

	@Override
	public int mUpdate(Member m) {
		return mDao.mUpdate(m);
	}

	@Override
	public int pwdCheck(Member m) {
		return mDao.pwdCheck(m);
	}

	@Override
	public int changePwd(Member changeM) {
		return mDao.changePwd(changeM);
	}

	@Override
	public ArrayList<Member> selectFollowList(int uNum) {
		return mDao.selectFollowList(uNum);
	}

	@Override
	public ArrayList<Member> selectFollowerList(int uNum) {
		
		return mDao.selectFollowerList(uNum);
	}

	@Override
	public ArrayList<Member> selectBlockList(int uNum) {
		return mDao.selectBlockList(uNum);
	}

	@Override
	public int countFollowList(int uNum) {
		return mDao.countFollowList(uNum);
	}

	@Override
	public int countFollowerList(int uNum) {
		return mDao.countFollowerList(uNum);
	}

	@Override
	public int followBtn(Member f) {
		return mDao.followBtn(f);
	}

	@Override
	public Member fselectUser(int uNum) {
		return mDao.fselectUser(uNum);
	}

	@Override
	public int unfollowBtn(Member f) {
		return mDao.unfollowBtn(f);
	}

	//1113은지
	@Override
	public ArrayList<Member> searchUserList1(String keyword) {
		return mDao.searchUserList1(keyword);
	}

	@Override
	public int searchUserCount(String keyword) {
		return  mDao.searchUserCount(keyword);
	}

	@Override
	public int mDelete(String id) {
		
		return mDao.mDelete(id);
	}
	@Override
	public Member nloginMember(String id) {

		return mDao.nloginMember(id);
	}

	@Override
	public int nInsertMember(Member m) {

		return mDao.nInsertMember(m);
	}

	@Override
	public int finduNum(String id) {
		return mDao.finduNum(id);
	}

	@Override
	public Member userPage(String id) {
	
		return mDao.userPage(id);
	}

	@Override
	public ArrayList<ChatRoom> messageList(String id) {
		return mDao.messageList(id);
	}

	@Override
	public ArrayList<ChatLog> chatLog(String chatid) {

		return mDao.chatLog(chatid);
	}

	@Override
	public int boardCount(int uNum) {
		
		return mDao.boardCount(uNum);
	}

	@Override
	public String findRoom(Map<String, String> map) {
		
		return mDao.findRoom(map);
	}

	@Override
	public int newRoom(Map<String, String> map) {
		return mDao.newRoom(map);
	}

	@Override
	public String recentChat(String chatroomid) {
		return mDao.recentChat(chatroomid);
	}

	@Override
	public int chatAlram(Map<String, String> map) {
		return mDao.chatAlram(map);
	}

	@Override
	public ArrayList<Board> myPost(int uNum) {
		
		return mDao.myPost(uNum);
	}

	@Override
	public int checkChat(Map<String, String> map) {
		return mDao.checkChat(map);
	}

	@Override
	public ArrayList<Member> tagList1(String keyword) {
		return mDao.tagList(keyword);
	}

	@Override
	public int searchtagCount(String keyword) {
		
		return mDao.tagcount(keyword);
	}

	@Override
	public ArrayList<Integer> coupleFind(int uNum) {
		return mDao.coupleFine(uNum);
	}

	



	//1113은지


}
