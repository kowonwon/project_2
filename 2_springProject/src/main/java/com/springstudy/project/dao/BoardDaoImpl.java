package com.springstudy.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springstudy.project.domain.Budget;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	private final String NAME_SPACE = "com.spirngstudy.proejct.mapper.BoardMapper";
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Budget> boardList() {
		return sqlSession.selectList(NAME_SPACE + ".boardList");
	}

	@Override
	public Budget getBoard(int no) {
		return null;
	}

	@Override
	public void insertBoard(Budget budget) {
		
	}

	@Override
	public String isPassCheck(int no, String pass) {
		return null;
	}

	@Override
	public void updateBoard(Budget budget) {
		
	}

	@Override
	public void deleteBoard(int no) {
		
	}
	
	// 년월 별로 게시글 필터링
	@Override
	public List<Budget> getBudgetByMonth(int year, int month) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("year", year);
		params.put("month", month);
		return sqlSession.selectList(NAME_SPACE+".getBudgetByMonth", params);
	}
}