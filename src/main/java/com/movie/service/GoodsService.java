package com.movie.service;

import java.util.List;

import com.movie.domain.GoodsVO;

public interface GoodsService {
	public void GoodsInsert(GoodsVO vo);
	public List<GoodsVO> getList();
	public GoodsVO goodsDetail(int num);
	//public String BoardCheck(String id,String pwd);
	
}
