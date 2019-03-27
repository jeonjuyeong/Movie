package com.movie.mapper;

import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestParam;

import com.movie.domain.MemberVO;

public interface MemberMapper {
	public void MemberInsert(MemberVO vo);
	
	public String idCheck(String id);
	
	public String memberCheck(String id);

	public MemberVO memberInfo(String id);
	
	public int getAllFunding(String id);

	public String findId(HashMap<String, String> idCheck);

	public void updatePassword(HashMap<String,String> map);

	public String checkEmail(HashMap<String,String> map);
}
