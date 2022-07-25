package com.ebookmarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.admin.domain.User;
import com.ebookmarket.admin.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	// 판매자회원 목록 페이지
	@Override
	public List<User> sellerList() throws Exception {
		return mapper.sellerlist();
	}

	// 탈퇴한 판매자회원 목록 페이지
	@Override
	public List<User> sellerResignList() throws Exception {
		return mapper.sellerresignlist();
	}

	// 일반회원 목록 페이지
	@Override
	public List<User> memberList() throws Exception {
		return mapper.memberlist();
	}

	// 탈퇴한 일반회원 목록 페이지
	@Override
	public List<User> memberResignList() throws Exception {
		return mapper.memberresignlist();
	}

	// 판매자회원 등급 설정
	@Override
	public void setGrade(User user) throws Exception {
		mapper.setGrade(user);
	}

}
