package com.ebookmarket.client.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebookmarket.client.domain.Ebook;
import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.Purchase;
import com.ebookmarket.client.domain.Seller;
import com.ebookmarket.client.security.domain.CustomUser;
import com.ebookmarket.client.service.EbookService;
import com.ebookmarket.client.service.PurchaseService;
import com.ebookmarket.client.service.SellerService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	private EbookService ebookService;

	@Autowired
	private SellerService sellerService;

	@Value("${upload.path}")
	private String uploadPath;

	// 회원 구매 상품 목록
	@RequestMapping(value = "/memberDownloadList", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String list(Model model, Authentication authentication, Locale locale) throws Exception {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();

		Member member = customUser.getMember();

		int m_num = member.getM_num();

		List<Purchase> list = purchaseService.list(m_num);

		model.addAttribute("list", list);

		return "mypage/memberDownloadList";

	}

	// 구매 상품 다운로드
	@ResponseBody
	@RequestMapping("/download")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public ResponseEntity<byte[]> download(int p_num, Authentication authentication) throws Exception {

		Purchase purchase = purchaseService.read(p_num);

		int e_num = purchase.getE_num();

		String fullName = purchase.getE_attachment_url();

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + File.separator + fullName);

			String fileName = fullName.substring(fullName.indexOf("_") + 1);

			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

			headers.add("Content-Disposition",
					"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {
			in.close();
			purchaseService.download_cnt(e_num);
			purchaseService.downloadComplate(p_num);
		}

		return entity;
	}

	// 평점
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String modify(HttpServletRequest request) throws Exception {

		String rating = request.getParameter("e_rating");
		String num = request.getParameter("e_num");
		String pnum = request.getParameter("p_num");

		int e_rating = Integer.parseInt(rating);
		int e_num = Integer.parseInt(num);
		int p_num = Integer.parseInt(pnum);

		Ebook ebook = new Ebook();
		ebook.setE_rating(e_rating);
		ebook.setE_num(e_num);

		Purchase purchase = new Purchase();
		purchase.setP_num(p_num);
		purchase.setP_rating(e_rating);

		log.info("4");
		purchaseService.modify(ebook);

		purchaseService.ratingComplate(purchase);

		return "redirect:/purchase/memberDownloadList";

	}

	// 환불 신청 페이지
	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String refundForm(int p_num, Model model) throws Exception {

		Purchase purchase = purchaseService.read(p_num);
		int e_num = purchase.getE_num();
		Ebook ebook = ebookService.read(e_num);

		model.addAttribute("purchase", purchase);
		model.addAttribute("ebook", ebook);
		return "mypage/refundApply";

	}

	// 환불 신청 처리
	@RequestMapping(value = "/refund", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String refund(Purchase purchase) throws Exception {

		purchaseService.refundApply(purchase);

		return "redirect:/";

	}

	// 환불 내역 페이지
	@RequestMapping(value = "/memberRefundList", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String memberRefundList(Model model, Authentication authentication) throws Exception {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();

		Member member = customUser.getMember();

		int m_num = member.getM_num();

		model.addAttribute("list", purchaseService.memberRefundList(m_num));

		return "mypage/memberRefundList";

	}

	// 판매내역 페이지
	@RequestMapping(value = "/sellerSalesList", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String sellerSalesList(Model model, Authentication authentication) throws Exception {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();

		Seller seller = customUser.getSeller();

		int s_num = seller.getS_num();

		model.addAttribute("list", purchaseService.sellerSalesList(s_num));

		return "sellerMypage/sellerSalesList";

	}

	// 환불 처리 페이지
	@RequestMapping(value = "/sellerRefundList", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String sellerRefundList(Model model, Authentication authentication) throws Exception {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();

		Seller seller = customUser.getSeller();

		int s_num = seller.getS_num();

		model.addAttribute("list", purchaseService.refundList(s_num));

		return "sellerMypage/sellerRefundList";

	}

	// 환불 관리 페이지
	@RequestMapping(value = "/sellerRefund", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String sellerRefundForm(int p_num, Model model) throws Exception {

		Purchase purchase = purchaseService.read(p_num);

		int e_num = purchase.getE_num();
		Ebook ebook = ebookService.read(e_num);

		model.addAttribute("purchase", purchase);
		model.addAttribute("ebook", ebook);
		return "sellerMypage/refundProcess";

	}

	// 환불 관리 처리
	@RequestMapping(value = "/sellerRefund", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String sellerRefund(Purchase purchase) throws Exception {

		if (purchase.getP_reason_refusal().equals("refundApproval")) {

			purchaseService.refundApproval(purchase);
			Purchase purchase2 = purchaseService.read(purchase.getP_num());
			int e_num = purchase2.getE_num();
			purchaseService.refund_cnt(e_num);

		} else {
			purchaseService.refundProcess(purchase);
		}

		return "redirect:/purchase/sellerRefundList";

	}

	// 정산관리 페이지
	@RequestMapping(value = "/sellerSettlementList", method = RequestMethod.GET)
	public String sellerSettlementList(Model model, @AuthenticationPrincipal CustomUser customUser) throws Exception {

		String userId = customUser.getUsername();

		Seller seller = sellerService.readByUserId(userId);

		int s_num = seller.getS_num();

		List<Ebook> ebookList = ebookService.uploadList(s_num);

		model.addAttribute("ebookList", ebookList);
		return "sellerMypage/sellerSettlementList";
	}
}
