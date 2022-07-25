package com.ebookmarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.admin.domain.AdminCategory;
import com.ebookmarket.admin.mapper.AdminCategoryMapper;

@Service
public class AdminCategoryServiceImpl implements AdminCategoryService {
	@Autowired
	private AdminCategoryMapper mapper;

	// 등록 처리
	@Override
	public void register(AdminCategory category) throws Exception {
		mapper.create(category);
	}

	// 목록 페이지
	@Override
	public List<AdminCategory> list() throws Exception {
		return mapper.list();
	}

	// 상세 페이지(수정 페이지)
	@Override
	public AdminCategory read(String category_code) throws Exception {
		return mapper.read(category_code);
	}

	// 수정 처리
	@Override
	public void modify(AdminCategory category) throws Exception {
		mapper.update(category);
	}

	// 삭제 처리
	@Override
	public void remove(String category_code) throws Exception {
		mapper.delete(category_code);
	}
}