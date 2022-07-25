package com.ebookmarket.admin.service;

import java.util.List;

import com.ebookmarket.admin.domain.User;

public interface UserService {
	// 판매자회원 목록 페이지
	public List<User> sellerList() throws Exception;

	// 탈퇴한 일반회원 목록 페이지
	public List<User> sellerResignList() throws Exception;

	// 일반회원 목록 페이지
	public List<User> memberList() throws Exception;

	// 탈퇴한 일반회원 목록 페이지
	public List<User> memberResignList() throws Exception;

	// 판매자회원 등급 설정
	public void setGrade(User user) throws Exception;
}
