package com.kh.lml.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lml.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	public int idCheck(String id) {
		return sqlSession.selectOne("memberMapper.idCheck",id);
	}
	public Member loginMember(Member m) {
		System.out.println("dao : " + m);
		return (Member)sqlSession.selectOne("memberMapper.loginMember",m);
	}
	public int nameCheck(String name) {
		return sqlSession.selectOne("memberMapper.nameCheck",name);
	}
	public int mUpdate(Member m) {
		return sqlSession.update("memberMapper.memberUpdate",m);
	}
	public int pwdCheck(Member m) {
		return sqlSession.selectOne("memberMapper.pwdCheck",m);
	}
	public int changePwd(Member changeM) {
		System.out.println("DDAO : " + changeM);
		return sqlSession.update("memberMapper.pwdChange",changeM);
	}
	public ArrayList<Member> selectFollowList(int uNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowList",uNum);
	}
	public ArrayList<Member> selectFollowerList(int uNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowerList",uNum);
	}
	public ArrayList<Member> selectBlockList(int uNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectBlockList",uNum);
	}
	public int countFollowList(int uNum) {
		return sqlSession.selectOne("memberMapper.countFollowList",uNum);
	}
	public int countFollowerList(int uNum) {
		return sqlSession.selectOne("memberMapper.countFollowerList",uNum);
	}
	public int followBtn(Member f) {
		return sqlSession.insert("memberMapper.followBtn",f);
	}
	public Member fselectUser(int uNum) {
		return sqlSession.selectOne("memberMapper.fselectUser",uNum);
	}
	public int unfollowBtn(Member f) {
		return sqlSession.delete("memberMapper.unfollowBtn",f);
	}
	
	//1113은지
	public ArrayList<Member> searchUserList1(String keyword) {
		return (ArrayList)sqlSession.selectList("memberMapper.searchUserList1", keyword);
	}
	public int searchUserCount(String keyword) {
		return sqlSession.selectOne("memberMapper.searchUserCount",keyword);
	}
	public int mDelete(String id) {
		return sqlSession.update("memberMapper.deleteMember",id);
	}
	public Member nloginMember(String id) {
		return sqlSession.selectOne("memberMapper.nloginMember",id);
	}
	
	//1113은지

}
