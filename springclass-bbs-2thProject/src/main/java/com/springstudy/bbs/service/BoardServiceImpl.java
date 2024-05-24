package com.springstudy.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springstudy.bbs.dao.BoardDao;
import com.springstudy.bbs.domain.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public List<Board> boardList() {
		
		return boardDao.boardList();
	}

	@Override
	public Board getBoard(int no) {
			
			return boardDao.getBoard(no);
		}

	@Override
	public void insertBoard(Board board) {
		
		
	}

	@Override
	public boolean isPassCheck(int no, String pass) {
		
		return false;
	}

	@Override
	public void updateBoard(Board board) {
		
		
	}

	@Override
	public void deleteBoard(int no) {
		
		
	}

}
