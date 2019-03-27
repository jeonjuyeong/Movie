package com.movie.service;

import com.movie.domain.MemberVO;

public interface MemberService {
	public void memberInsert(MemberVO mvo);

	public String memberCheck(String id,String pwd);
	
	public String idCheck(String id);
	
	public MemberVO memberInfo(String id);
	
	public int getAllFunding(String id);

	public String findId(String name, String email);

	public void updatePassword(String id, String password);

	public String checkEmail(String id, String email);
	
	
}
