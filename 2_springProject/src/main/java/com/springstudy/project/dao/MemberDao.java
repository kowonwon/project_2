package com.springstudy.project.dao;

import com.springstudy.project.domain.Member;

public interface MemberDao {
	
	String memberPassCheck(String id);
	
	void updateMember(Member member);
	
	void addMember(Member member);
	
	public Member getMember(String id);
}
