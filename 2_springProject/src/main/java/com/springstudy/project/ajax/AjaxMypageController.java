package com.springstudy.project.ajax;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springstudy.project.domain.Budget;
import com.springstudy.project.service.BoardService;

@Controller
@SessionAttributes("member")
public class AjaxMypageController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/myPage")
	public String myBoardList(Model model, 
			@SessionAttribute("nickname") String writer) {
	
		List <Budget> myList = boardService.myBoardList(writer);
		model.addAttribute("myList", myList);
		return "myPage";
	}
	
	@RequestMapping("/insertList.ajax")
	@ResponseBody
	public List<Budget> insertList(@RequestBody Budget budget){
		boardService.insertList(budget);
		System.out.println("date");
		return boardService.myBoardList(budget.getWriter());
				
	}
	
	 @PostMapping("/deleteList.ajax")
	 @ResponseBody
	    public List<Budget> deleteList(@RequestBody Map<String, Object> payload) {
		 	int no = Integer.parseInt((String) payload.get("no"));
	        String writer = (String) payload.get("writer");
	        System.out.println("no: " + no + ", writer: " + writer); // 디버깅 로그 추가
	        boardService.deleteList(no);
	        return boardService.myBoardList(writer);
	    }
	
	@PostMapping("/updateList.ajax")
	@ResponseBody
	public List<Budget> updateList(@RequestBody Budget budget) {
		boardService.updateList(budget);
		return boardService.myBoardList(budget.getWriter());
	}
}
