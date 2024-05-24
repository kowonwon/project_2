package com.springstudy.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springstudy.bbs.domain.Board;
import com.springstudy.bbs.service.BoardService;

@Controller
public class BoardController {
// 스프링 MVC의 컨트롤러임을 선언
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/boardDetail")
	public String boardDetail(Model model, int no) {
		
		// Service 클래스를 이용해 no에 해당하는 게시 글을 가져온다.
		Board board = boardService.getBoard(no);
		
		model.addAttribute("board", board);
		
		return "boardDetail";
	}

	@RequestMapping(value= {"/boardList", "/list"}, method=RequestMethod.GET)
	public String boardList(Model model) {
		
		// Service 클래스를 이용해 게시 글 리스트를 가져온다.
		List<Board> bList = boardService.boardList();
		
		// 파라미터로 받은 모델 객체에 뷰로 보낼 모델을 저장한다.
		// 모델에는 도메인 객체나 비지니스 로직을 처리한 결과를 저장한다.
		model.addAttribute("bList", bList);
		
		// servlet-context.xml에 설정한 ViewResolver에서 prefix와 suffix에 지정한 정보를 제외한 뷰 이름을 문자열로 반환하면 된다.
		// 아래와 같이 뷰 이름을 반환하면 forward가 되어 제어가 뷰 페이지로 이동한다.
		return "boardList";
	}
	
}
