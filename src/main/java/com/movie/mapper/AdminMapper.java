package com.movie.mapper;

import java.util.List;

import com.movie.domain.GoodsVO;
import com.movie.domain.MemberVO;
import com.movie.domain.PayVO;

public interface AdminMapper {

	public List<MemberVO> memberList();
	public List<PayVO> payList();
	public List<GoodsVO> goodsList();
	public void memberDelete(String id) ;
	public void goodsDelete(int num) ;

}
