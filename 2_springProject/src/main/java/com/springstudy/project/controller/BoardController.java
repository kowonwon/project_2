package com.springstudy.project.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springstudy.project.service.BoardService;
import com.springstudy.project.domain.Budget;
import com.springstudy.project.domain.Reply;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping({"/delete", "deleteBoard"})
	public String deleteBoard(HttpServletResponse response, int no) {
		boardService.deleteBoard(no);
		return "redirect:boardList";
	}
	
	@RequestMapping(value="updateProcess", method=RequestMethod.POST)
	public String updateBoard(HttpServletResponse response,
	PrintWriter out, Budget budget) {
		boardService.updateBoard(budget);
		return "redirect:boardList";
	}
	
	@RequestMapping(value="/update")
	public String updateBoard(Model model, HttpServletResponse response, PrintWriter out, int no, String pass) {
		Budget budget = boardService.getBoard(no);
		model.addAttribute("budget", budget);
		return "updateForm";
	}
	
	@RequestMapping(value="/writeProcess", method=RequestMethod.POST)
	public String insertBoard(Budget budget) {
		boardService.insertBoard(budget);
		return "redirect:boardList";
	}
	
	@RequestMapping("/boardDetail")
	public String boardDetail(Model model, int no) {
		Budget budget = boardService.getBoard(no);
		model.addAttribute("budget", budget);
		
		List<Budget> budgetList = boardService.boardListForOne(budget.getWriter(), budget.getDate());
		model.addAttribute("budgetList", budgetList);
		
		List<Reply> replyList = boardService.replyList(no);
		model.addAttribute("replyList", replyList);
		
		return "boardDetail";
	}
	
	@RequestMapping("/calendar")
	public String calendar() {
		return "calendar";
	}
//	
//	@RequestMapping(value={"/boardList", "/list"}, method=RequestMethod.GET)
//	public String boardList(Model model) {
//		List<Budget> bList = boardService.boardList();
//		model.addAttribute("bList", bList);
//		return "boardList";
//	}
	@RequestMapping("/boardList")
	public String boardList() {
		return "boardList";
	}
}
