package com.ebookmarket.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebookmarket.admin.domain.SalesStatus;
import com.ebookmarket.admin.service.SalesService;
import com.ebookmarket.common.domain.CodeLabelValue;
import com.ebookmarket.common.domain.PageRequest;
import com.ebookmarket.common.domain.Pagination;

@Controller
@RequestMapping("/admin/sales")
public class SalesController {

	@Autowired
	private SalesService service;

	// 매출 현황 페이지
	@RequestMapping(value = "/salesStatus", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void salesStatus(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		List<SalesStatus> salesStatus = service.salesStatus(pageRequest);
		model.addAttribute("salesStatus", salesStatus);

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);

		// 페이지 네비게이션 정보에 검색 처리된 게시글 건수를 저장한다(변경).
		pagination.setTotalCount(service.salesCount(pageRequest));

		model.addAttribute("pagination", pagination);

		// 검색 유형의 코드명과 코드값을 정의한다.
		List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
		searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
		searchTypeCodeValueList.add(new CodeLabelValue("t", "작품명"));
		searchTypeCodeValueList.add(new CodeLabelValue("w", "작가"));

		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}

	// 거래 내역 페이지
	@RequestMapping(value = "/transactionHistory", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void transactionHistory(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		List<SalesStatus> transactionHistory = service.transactionHistory(pageRequest);
		model.addAttribute("transactionHistory", transactionHistory);

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);

		// 페이지 네비게이션 정보에 검색 처리된 게시글 건수를 저장한다(변경).
		pagination.setTotalCount(service.transactionCount(pageRequest));

		model.addAttribute("pagination", pagination);

		// 검색 유형의 코드명과 코드값을 정의한다.
		List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
		searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
		searchTypeCodeValueList.add(new CodeLabelValue("t", "작품명"));
		searchTypeCodeValueList.add(new CodeLabelValue("w", "작가"));

		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}

}
