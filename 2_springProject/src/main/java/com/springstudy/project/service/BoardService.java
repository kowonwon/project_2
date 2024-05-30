package com.springstudy.project.service;

import java.sql.Timestamp;
import java.util.List;

import com.springstudy.project.domain.Budget;
import com.springstudy.project.domain.Reply;

public interface BoardService {
	void deleteList(int no);
	
	void updateList(Budget budget);

	void insertList(Budget budget);
	
	void deleteReply(int no);
	
	void updateReply(Reply reply);


	List<Budget> myBoardList(String writer);
	
	List<Budget> boardListForOne(String writer, Timestamp date);

	void addReply(Reply reply);
	
	List<Reply> replyList(int no);
	
	List<Budget> getBudgetByMonth(int year, int month);
	
	List<Budget> boardList();
	
	Budget getBoard(int no);
	
	void insertBoard(Budget budget);
	
	void updateBoard(Budget budget);
	
	void deleteBoard(int no);
}
