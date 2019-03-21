package com.movie.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.domain.GoodsPriceVO;
import com.movie.domain.GoodsVO;
import com.movie.domain.PayVO;
import com.movie.mapper.GoodsMapper;

import lombok.Setter;
@Service
public class GoodsServiceImpl implements GoodsService{

	@Setter(onMethod_ = @Autowired)
	private GoodsMapper mapper;

	@Override
	public void GoodsInsert(GoodsVO vo) {
		mapper.GoodsInsert(vo);
		//GoodsVO vo = mapper.
		 // MemberVO vo = mapper.Board(id); System.out.println(id); return vo;

	}

	@Override
	public List<GoodsVO> getList() {
		List<GoodsVO> gList = mapper.getList();
		return gList;
		 
	}

	@Override
	public GoodsVO goodsDetail(int num) {
		GoodsVO gVO = mapper.goodsDetail(num);
		return gVO;
	}

	@Override
	public void goodsPriceInsert(GoodsPriceVO vo) {
		mapper.GoodsPriceInsert(vo);
		
	}

	@Override
	public ArrayList<GoodsPriceVO> goodsPriceDetal(int num) {
			
		return mapper.GoodsPriceDetail(num);
	}

	@Override
	public void goodsCurrentUpdate(PayVO vo) {
		System.out.println("service:"+vo.getPrice());
			mapper.goodsCurrentUpdate(vo);
		
	}

	@Override
	public void goodsPayInsert(PayVO vo) {
		mapper.goodsPayInsert(vo);
		
	}



}
