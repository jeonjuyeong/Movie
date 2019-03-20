package com.movie.mapper;

import java.util.List;

import com.movie.domain.GoodsVO;

public interface GoodsMapper {
	public void GoodsInsert(GoodsVO vo);
	public List<GoodsVO> getList();
	public GoodsVO goodsDetail(int num);
}
