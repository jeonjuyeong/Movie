package com.movie.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.movie.domain.GoodsPriceVO;
import com.movie.domain.GoodsVO;
import com.movie.domain.PayVO;
import com.movie.domain.getMyFundingVO;

public interface GoodsMapper {
	public void GoodsInsert(GoodsVO vo);
	public List<GoodsVO> getList();
	public GoodsVO goodsDetail(int num);
	public void GoodsPriceInsert(GoodsPriceVO vo);
	public ArrayList<GoodsPriceVO> GoodsPriceDetail(int num);
	public void goodsCurrentUpdate(PayVO vo);
	public void goodsPayInsert(PayVO vo);
	public List<GoodsPriceVO> getGoodsPrice(int num);
	public List<getMyFundingVO> getMyFunding(HashMap<String, String> map);
	public int fundingCount(HashMap<String, String> map);
}
