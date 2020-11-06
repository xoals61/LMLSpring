package com.kh.lml.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lml.member.model.vo.Member;
import com.kh.lml.member.model.dao.MemberDao;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao mDao;

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

}
