package com.springstudy.project.dao;

import com.springstudy.project.domain.Member;

public interface MemberDao {
	
	void addMember(Member member);
	
	public Member getMember(String id);
}
