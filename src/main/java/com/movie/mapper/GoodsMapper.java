package com.movie.mapper;

import java.util.ArrayList;
import java.util.List;

import com.movie.domain.GoodsPriceVO;
import com.movie.domain.GoodsVO;

public interface GoodsMapper {
	public void GoodsInsert(GoodsVO vo);
	public List<GoodsVO> getList();
	public GoodsVO goodsDetail(int num);
	public void GoodsPriceInsert(GoodsPriceVO vo);
	public ArrayList<GoodsPriceVO> GoodsPriceDetail(int num);
}
