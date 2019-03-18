package com.movie.mapper;

import com.movie.domain.MemberVO;

public interface MemberMapper {
	public void MemberInsert(MemberVO vo);
	
	public String idCheck(String id);
	
	public String memberCheck(String id);

	public MemberVO memberInfo(String id);
}
