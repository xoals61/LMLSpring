package com.kh.lml.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lml.member.model.vo.Member;
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






}
