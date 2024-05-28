package com.springstudy.project.service;

import java.util.List;

import com.springstudy.project.domain.Budget;
import com.springstudy.project.domain.Reply;

public interface BoardService {
	List<Reply> replyList(int no);
	
	List<Budget> getBudgetByMonth(int year, int month);
	
	List<Budget> boardList();
	
	Budget getBoard(int no);
	
	void insertBoard(Budget budget);
	
	void updateBoard(Budget budget);
	
	void deleteBoard(int no);
}
