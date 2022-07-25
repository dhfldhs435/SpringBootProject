package com.ebookmarket.admin.mapper;

import java.util.List;

import com.ebookmarket.admin.domain.SalesStatus;
import com.ebookmarket.common.domain.PageRequest;

public interface SalesMapper {
	// 매출 현황 페이지
	public List<SalesStatus> salesstatus(PageRequest pageRequest) throws Exception;

	// 거래 내역 페이지
	public List<SalesStatus> transactionhistory(PageRequest pageRequest) throws Exception;

	// 매출 현황 전체 건수를 반환한다.
	public int salescount(PageRequest pageRequest) throws Exception;

	// 거래 내역 전체 건수를 반환한다.
	public int transactioncount(PageRequest pageRequest) throws Exception;
}
