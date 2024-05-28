package com.springstudy.project.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springstudy.project.domain.Reply;
import com.springstudy.project.service.BoardService;

@Controller
public class BoardAjaxController {
	
	@Autowired
	BoardService boardService;
	
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