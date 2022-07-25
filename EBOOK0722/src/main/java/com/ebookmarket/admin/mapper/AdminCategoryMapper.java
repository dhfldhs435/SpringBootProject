package com.ebookmarket.admin.mapper;

import java.util.List;

import com.ebookmarket.admin.domain.AdminCategory;

public interface AdminCategoryMapper {
	// 등록 처리
	public void create(AdminCategory category) throws Exception;

	// 목록 페이지
	public List<AdminCategory> list() throws Exception;

	// 상세 페이지(수정 페이지)
	public AdminCategory read(String category_code) throws Exception;

	// 수정 처리
	public void update(AdminCategory category) throws Exception;

	// 삭제 처리
	public void delete(String category_code) throws Exception;

}
