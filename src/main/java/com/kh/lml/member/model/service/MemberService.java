package com.kh.lml.member.model.service;

import java.util.ArrayList;

import com.kh.lml.member.model.vo.Member;

public interface MemberService {
	//회원가입
	int insertMember(Member m);

	//아이디중복체크
	int idCheck(String id);

	Member loginMember(Member m);

	int nameCheck(String name);

	int mUpdate(Member m);

	int pwdCheck(Member m);

	int changePwd(Member changeM);

	ArrayList<Member> selectFollowList(int uNum);

	ArrayList<Member> selectFollowerList(int uNum);

	ArrayList<Member> selectBlockList(int uNum);

	int countFollowList(int uNum);

	int countFollowerList(int uNum);

	int followBtn(Member f);

	Member fselectUser(int uNum);

	int unfollowBtn(Member f);

	//1113은지
	ArrayList<Member> searchUserList1(String keyword);

	int searchUserCount(String keyword);

	int mDelete(String id);

	//1113은지

	


}
