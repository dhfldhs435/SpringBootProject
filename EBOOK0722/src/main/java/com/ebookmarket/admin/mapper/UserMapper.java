package com.ebookmarket.admin.mapper;

import java.util.List;

import com.ebookmarket.admin.domain.User;

public interface UserMapper {
	// 판매자회원 목록 페이지
	public List<User> sellerlist() throws Exception;

	// 탈퇴한 판매자회원 목록 페이지
	public List<User> sellerresignlist() throws Exception;

	// 일반회원 목록 페이지
	public List<User> memberlist() throws Exception;

	// 탈퇴한 일반회원 목록 페이지
	public List<User> memberresignlist() throws Exception;

	// 판매자회원 등급 설정
	public void setGrade(User user) throws Exception;
}
