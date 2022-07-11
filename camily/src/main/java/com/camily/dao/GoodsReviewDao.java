package com.camily.dao;

import java.util.ArrayList;

import com.camily.dto.GoodsReviewDto;

public interface GoodsReviewDao {
	
	ArrayList<GoodsReviewDto> selectGoodsReviewList();

}
