package com.ebookmarket.client.mapper;

import java.util.List;

import com.ebookmarket.client.domain.Ebook;
import com.ebookmarket.client.domain.Purchase;

public interface PurchaseMapper {

	// 구매 처리
	public void create(Purchase purChase) throws Exception;

	// 판매수 증가 처리
	public void sell_cnt(Purchase purChase) throws Exception;

	// 구매 상품 목록
	public List<Purchase> list(Integer m_num) throws Exception;

	// 구매 상품 보기
	public Purchase read(Integer p_num) throws Exception;

	// 평점
	public void modify(Ebook ebook) throws Exception;

	public void refundApply(Purchase purchase) throws Exception;

	public void refund_cnt(int e_num) throws Exception;

	public List<Purchase> refundList(int s_num) throws Exception;

	public void refundProcess(Purchase purchase) throws Exception;

	public void refundApproval(Purchase purchase) throws Exception;

	public List<Purchase> memberRefundList(int m_num) throws Exception;

	public List<Purchase> sellerSalesList(int s_num) throws Exception;

	public void download_cnt(int e_num) throws Exception;

	public void downloadComplate(int p_num) throws Exception;

	public void ratingComplate(Purchase purchase) throws Exception;

}
