package com.kh.lml.find_idPw.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("fipDao")
public class find_idPw_Dao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public String findNamePhone(String findname, String findphone) {
		Map map = new HashMap();
		map.put("findname", findname);
		map.put("findphone", findphone);
		String str = sqlSession.selectOne("memberMapper.findNamePhone",map);
		return str;
	}

	public String findNameEmail(String findname, String findEmail) {
		Map map = new HashMap();
		map.put("findname", findname);
		map.put("findEmail", findEmail);
		String str = sqlSession.selectOne("memberMapper.findNameEmail",map);
		return str;
	}

	public String findPwIdEmail(String id, String e_mail) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("email", e_mail);
		String str = sqlSession.selectOne("memberMapper.findPwIdEmail",map);
		return str;
	}
}