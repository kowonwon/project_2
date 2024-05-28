package com.springstudy.project.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springstudy.project.domain.Budget;
import com.springstudy.project.service.BoardService;

@Controller
public class AjaxMypageController {
	
	@Autowired
	private BoardService boardService;
	
//	@RequestMapping("/myBoardList.ajax")
//	@ResponseBody
//	public List<Budget> myBoardList(
//				@RequestParam("id") String writer)	{
//		List<Budget> list = boardService.myBoardList(writer);
//		return list;
//	}
}
