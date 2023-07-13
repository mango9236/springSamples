package ssg.com.a.service;

import ssg.com.a.dto.MemberDto;

public interface MemberService {
	
	boolean idcheck(String id); // 프로토타입
	
	boolean addmember(MemberDto dto);
	
	MemberDto login(MemberDto dto);
}
