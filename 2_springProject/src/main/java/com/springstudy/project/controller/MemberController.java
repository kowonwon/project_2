package com.springstudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springstudy.project.domain.Member;
import com.springstudy.project.service.MemberService;

@Controller
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/joinResult")
	public String joinResult(Model model, Member member,
			String pass1, String emailId, String emailDomain,
			String mobile1, String mobile2, String mobile3,
			@RequestParam(value="emailGet", defaultValue="false")boolean emailGet) {
		member.setPass(pass1);
		member.setEmail(emailId + "@" + emailDomain);
		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
		
		memberService.addMember(member);
		return "redirect:calendar";
	}
	
	@RequestMapping("/overlapIdCheck")
	public String overlapIdCheck(Model model, String id) {
		boolean overlap = memberService.overlapIdCheck(id);
		model.addAttribute("id", id);
		model.addAttribute("overlap", overlap);
		
		return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Model model, @RequestParam("id") String id,
			@RequestParam("pass") String pass, HttpSession session,
			HttpServletResponse response) throws ServletException, IOException {
		int result = memberService.login(id, pass);
		
		if(result == -1) {
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디 입니다.');");
			out.println(" history.back();");
			out.println("</script>");
			
			return null;
			} else if(result == 0) { response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');"); 
			out.println(" location.href='loginForm'"); 
			out.println("</script>");
			return null;
			}
		
		Member member = memberService.getMember(id);
		session.setAttribute("isLogin", true);
		
		model.addAttribute("member", member); 
		session.setAttribute("nickname", member.getNickname());
		System.out.println("member.name : " + member.getNickname());
		
		return "redirect:/calendar";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/calendar";
	}
}
