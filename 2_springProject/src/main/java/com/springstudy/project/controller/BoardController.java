package com.springstudy.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springstudy.project.service.BoardService;
import com.springstudy.project.domain.Budget;

@Controller
public class BoardController {

	@Autowired(required=false)
	private BoardService boardService;
	
	@RequestMapping("/writeForm")
	public String myBoardList(Model model, 
				@RequestParam("id") String writer) {
		List <Budget> myList = boardService.myBoardList(writer);
		model.addAttribute("myList", myList);
		return "redirect:writeForm?id=이현학";
	}
	
	@RequestMapping("/calendar")
	public String calendar() {
		return "calendar";
	}
	
	@RequestMapping(value={"/boardList", "/list"}, method=RequestMethod.GET)
	public String boardList(Model model) {
		List<Budget> bList = boardService.boardList();
		model.addAttribute("bList", bList);
		return "boardList";
	}
}
