package com.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.domain.GoodsVO;
import com.movie.domain.MemberVO;
import com.movie.domain.PayVO;
import com.movie.mapper.AdminMapper;
import com.movie.mapper.GoodsMapper;
import com.movie.mapper.MemberMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService{

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Override
	public List<GoodsVO> goodsList() {
		
		return mapper.goodsList();
	}

	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return mapper.memberList();
	}

	@Override
	public List<PayVO> payList() {
		// TODO Auto-generated method stub
		return mapper.payList();
	}

	@Override
	public void memberDelete(String id) {
		mapper.memberDelete(id);
		
	}

	@Override
	public void goodsDlelete(int num) {
		mapper.goodsDelete(num);
		
	}

}
