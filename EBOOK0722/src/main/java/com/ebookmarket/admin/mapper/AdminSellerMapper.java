package com.ebookmarket.admin.mapper;

import java.util.List;

import com.ebookmarket.admin.domain.Seller;

public interface AdminSellerMapper {
	// 판매자회원 목록 페이지
	public List<Seller> list() throws Exception;
}
