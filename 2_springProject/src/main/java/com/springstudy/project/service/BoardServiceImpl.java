package com.springstudy.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springstudy.project.dao.BoardDao;
import com.springstudy.project.domain.Budget;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired(required=false)
	private BoardDao boardDao;
	
	@Override
	public List<Budget> boardList() {
		return boardDao.boardList();
	}

	@Override
	public Budget getBoard(int no) {
		return null;
	}

	@Override
	public void insertBoard(Budget budget) {
	}

	@Override
	public void updateBoard(Budget budget) {
	}

	@Override
	public void deleteBoard(int no) {
	}

	
	// 게시글 년 월 별 필터링
	@Override
	public List<Budget> getBudgetByMonth(int year, int month) {
		return boardDao.getBudgetByMonth(year, month);
	}
	
	
	// 개인용 보드리스트 ajax 사용
	@Override
	public List<Budget> myBoardList(String writer) {
		return boardDao.myBoardList(writer);
	}
}