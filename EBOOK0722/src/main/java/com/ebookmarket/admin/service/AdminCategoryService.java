package com.ebookmarket.admin.service;

import java.util.List;

import com.ebookmarket.admin.domain.AdminCategory;

public interface AdminCategoryService {
	// 등록 처리
	public void register(AdminCategory category) throws Exception;

	// 목록 페이지
	public List<AdminCategory> list() throws Exception;

	// 상세 페이지
	public AdminCategory read(String category_code) throws Exception;

	// 수정 처리
	public void modify(AdminCategory category) throws Exception;

	// 삭제 처리
	public void remove(String category_code) throws Exception;

}
