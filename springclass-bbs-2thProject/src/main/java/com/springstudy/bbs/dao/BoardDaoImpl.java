package com.springstudy.bbs.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springstudy.bbs.domain.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	private final String NAME_SPACE = "com.springstudy.bbs.mapper.BoardMapper";
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Board> boardList() {
		
		return sqlSession.selectList(NAME_SPACE + ".boardList");
	}

	@Override
	public Board getBoard(int no) {
		
		// getBoard 맵핑 구문을 호출하면서 게시 글 번호인 no를 parameter(파라미터)로 지정했다.
		return sqlSession.selectOne(NAME_SPACE + ".getBoard", no);
	}

	@Override
	public void insertBoard(Board board) {
		
		
	}

	@Override
	public String isPassCheck(int no, String pass) {
		
		return null;
	}

	@Override
	public void deleteBoard(int no) {
		
		
	}

}
