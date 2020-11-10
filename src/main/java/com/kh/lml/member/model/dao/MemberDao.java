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
	


}
