package com.springstudy.project.ajax;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springstudy.project.domain.Budget;
import com.springstudy.project.service.BoardService;

@Controller
public class AjaxCalendarController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/calendar.ajax")
	@ResponseBody
	public List<Budget> calnedarList(
				@RequestParam("year") int year,
				@RequestParam("month") int month){
		System.out.println(year);
		System.out.println(month);
		List<Budget> list = boardService.getBudgetByMonth(year, month);
		return list;
	}
}
