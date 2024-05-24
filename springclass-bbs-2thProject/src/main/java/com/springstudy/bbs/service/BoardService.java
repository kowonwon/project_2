package com.springstudy.bbs.service;

import java.util.List;

import com.springstudy.bbs.domain.Board;

public interface BoardService {
	
	// BoardDao를 이용해 게시판 테이블에서 현재 페이지에 해당하는 게시 글 리스트를 읽어와 반환하는 메서드
	public abstract List<Board> boardList();
	
	// BoardDao를 이용해 게시판 테이블에서 no에 해당하는 게시 글을 읽어와 반환하는 메서드
	public abstract Board getBoard(int no);
	
	// BoardDao를 이용해 새로운 게시 글을 추가하는 메서드
	public abstract void insertBoard(Board board);
	
	// 게시 글 수정과 삭제 할 때 비밀번호가 맞는지 체크하는 메서드
	// 게시 글의 비밀번호가 맞다면 : true, 게시 글의 비밀번호가 틀리다면 : false
	public boolean isPassCheck(int no, String pass);
	
	// BoardDao를 이용해 게시 글을 수정하는 메서드
	public abstract void updateBoard(Board board);
	
	// BoardDao를 이용해 no에 해당하는 게시 글을 삭제하는 메서드
	public abstract void deleteBoard(int no);
}
