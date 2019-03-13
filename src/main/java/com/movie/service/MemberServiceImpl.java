package com.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.domain.MemberVO;
import com.movie.mapper.MemberMapper;

import lombok.Setter;
@Service
public class MemberServiceImpl implements MemberService{
	
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	
	@Override
	public void memberInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		mapper.MemberInsert(mvo);
	}

	@Override
	public MemberVO memberCheck(String id, String pwd) {
		
		return mapper.memberCheck(id,pwd);
	}

	@Override
	public String idCheck(String id) {
		
		return mapper.idCheck(id);
	}
}
