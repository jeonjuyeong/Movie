package com.movie.service;

import java.util.List;

import com.movie.domain.GoodsVO;
import com.movie.domain.MemberVO;
import com.movie.domain.PayVO;

public interface AdminService {
	public List <GoodsVO> goodsList();
	public List<MemberVO> memberList();
	public List<PayVO> payList();
	public void memberDelete(String id);
	public void goodsDlelete(int num);
	
}
