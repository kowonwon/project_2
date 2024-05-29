package com.springstudy.project.service;

import com.springstudy.project.domain.Member;

public interface MemberService {
	
	boolean memberPassCheck(String id, String pass);
	
	void updateMember(Member member);
	
	boolean overlapIdCheck(String id);
	
	void addMember(Member member);
	
	public int login(String id, String pass);
	
	public Member getMember(String id);
}
