package com.springstudy.project.service;

import com.springstudy.project.domain.Member;

public interface MemberService {
	public int login(String id, String pass);
	
	public Member getMember(String id);
}
