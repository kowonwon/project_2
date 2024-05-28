package com.springstudy.project.dao;

import java.util.List;

import com.springstudy.project.domain.Budget;
import com.springstudy.project.domain.Reply;

public interface BoardDao {
	
	void updateReply(Reply reply);
	
	List<Budget> myBoardList(String writer);
	
	void addReply(Reply reply);
	
	List<Reply> replyList(int no);
	
	List<Budget> getBudgetByMonth(int year, int month);
	
	List<Budget> boardList();
	
	Budget getBoard(int no);
	
	void insertBoard(Budget budget);
	
	void updateBoard(Budget budget);
	
	void deleteBoard(int no);
}
