package com.ebookmarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.admin.domain.SalesStatus;
import com.ebookmarket.admin.mapper.SalesMapper;
import com.ebookmarket.common.domain.PageRequest;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	private SalesMapper mapper;

	// 매출 현황 페이지
	@Override
	public List<SalesStatus> salesStatus(PageRequest pageRequest) throws Exception {
		return mapper.salesstatus(pageRequest);
	}

	// 거래 내역 페이지
	@Override
	public List<SalesStatus> transactionHistory(PageRequest pageRequest) throws Exception {
		return mapper.transactionhistory(pageRequest);
	}
	
	// 매출 현황 전체 건수를 반환한다.
	@Override
	public int salesCount(PageRequest pageRequest) throws Exception {
		return mapper.salescount(pageRequest);
	}

	// 거래 내역 전체 건수를 반환한다.
	@Override
	public int transactionCount(PageRequest pageRequest) throws Exception {
		return mapper.transactioncount(pageRequest);
	}

}
