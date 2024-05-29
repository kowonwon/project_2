package com.springstudy.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import com.springstudy.project.dao.MemberDao;
import com.springstudy.project.domain.Member;

@Controller
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public int login(String id, String pass) {
		Member member = memberDao.getMember(id);
		int result = -1;
		
		if(member == null) { //id가 널
			return result;
		}
		
		// 비번이 맞으면 1 틀리면 0
		if(passwordEncoder.matches(pass, member.getPass())) {
			result =1;
		} else {
			result = 0;
		}
		return result;
	}

	@Override
	public Member getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override
	public boolean overlapIdCheck(String id) {
		Member member = memberDao.getMember(id);
		if(member == null) {
			return false;
		}
		return true;
	}

	@Override
	public void addMember(Member member) {
		member.setPass(passwordEncoder.encode(member.getPass()));
		memberDao.addMember(member);
	}

	@Override
	public boolean memberPassCheck(String id, String pass) {
		String dbPass = memberDao.memberPassCheck(id);
		boolean result = false;
		if(passwordEncoder.matches(pass, dbPass)) {
			result = true;
		}
		return result;
	}

	@Override
	public void updateMember(Member member) {
		member.setPass(passwordEncoder.encode(member.getPass()));
		memberDao.updateMember(member);
	}

}
