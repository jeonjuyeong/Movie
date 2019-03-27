package com.movie.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.movie.domain.GoodsPriceVO;
import com.movie.domain.GoodsVO;
import com.movie.domain.PayVO;
import com.movie.domain.getMyFundingVO;

public interface GoodsService {
	public void GoodsInsert(GoodsVO vo);
	public List<GoodsVO> getList(int page);
	public GoodsVO goodsDetail(int num);
	public void goodsPriceInsert(GoodsPriceVO vo);
	//public String BoardCheck(String id,String pwd);
	public ArrayList<GoodsPriceVO> goodsPriceDetal(int num);
	public void goodsCurrentUpdate(PayVO vo);
	public void goodsPayInsert(PayVO vo);
	public List<GoodsPriceVO> getGoodsPrice(int num);
	
	public List<getMyFundingVO> getMyFunding(String id,int page);
	
	public int fundingCount(String id);
	public int getListCnt();
	public List<GoodsVO> getMyFinancing(String id);
	
}
