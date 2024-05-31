package com.springstudy.project.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springstudy.project.domain.Budget;
import com.springstudy.project.domain.Reply;
import com.springstudy.project.service.BoardService;

@Controller
public class BoardAjaxController {
	
	@Autowired
	BoardService boardService;
	
	//월별데이터 출력
	@RequestMapping("/boardList.ajax")
	@ResponseBody
	public List<Budget> boardList(
			@RequestParam("year") int year,
			@RequestParam("month") int month){
      
	List<Budget> list = boardService.getBudgetByMonth(year, month);
	
	return list;
	}
	
	@RequestMapping("/replyDelete.ajax")
	@ResponseBody
	public List<Reply> deleteReply(int no, int bbsNo) {
		boardService.deleteReply(no);
		return boardService.replyList(bbsNo);
	}
	
	@RequestMapping("/replyUpdate.ajax")
	@ResponseBody
	public List<Reply> updateReply(Reply reply) {
		boardService.updateReply(reply);
		return boardService.replyList(reply.getBbsNo());
	}
	
	@RequestMapping("/replyWrite.ajax")
	@ResponseBody
	public List<Reply> addReply(Reply reply) {
		boardService.addReply(reply);
		return boardService.replyList(reply.getBbsNo());
	}
}