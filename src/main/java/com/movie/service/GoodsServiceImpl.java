package com.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.domain.GoodsVO;
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


}
