package com.springstudy.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springstudy.project.dao.BoardDao;
import com.springstudy.project.domain.Budget;
import com.springstudy.project.domain.Reply;

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
		return boardDao.getBoard(no);
	}

	@Override
	public void insertBoard(Budget budget) {
		boardDao.insertBoard(budget);
	}

	@Override
	public void updateBoard(Budget budget) {
		boardDao.updateBoard(budget);
	}

	@Override
	public void deleteBoard(int no) {
		boardDao.deleteBoard(no);
	}

	// 게시글 년 월 별 필터링
	@Override
	public List<Budget> getBudgetByMonth(int year, int month) {
		return boardDao.getBudgetByMonth(year, month);
	}

	@Override
	public List<Reply> replyList(int no) {
		return boardDao.replyList(no);
	}

	@Override
	public void addReply(Reply reply) {
		boardDao.addReply(reply);
	}
}