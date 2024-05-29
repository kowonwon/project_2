package com.springstudy.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springstudy.project.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	private static final String NAME_SPACE = "com.springstudy.project.mapper.MemberMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member getMember(String id) {
		return sqlSession.selectOne(NAME_SPACE+".getMember", id);
	}

	@Override
	public void addMember(Member member) {
		sqlSession.insert(NAME_SPACE + ".addMember", member);
	}

}
