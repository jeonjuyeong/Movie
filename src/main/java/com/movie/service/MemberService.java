package com.movie.service;

import com.movie.domain.MemberVO;

public interface MemberService {
	public void memberInsert(MemberVO mvo);

	public String memberCheck(String id,String pwd);
	
	public String idCheck(String id);
}
