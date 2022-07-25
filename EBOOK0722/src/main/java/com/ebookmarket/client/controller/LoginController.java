package com.ebookmarket.client.controller;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.Seller;
import com.ebookmarket.client.service.MemberService;
import com.ebookmarket.client.service.SellerService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/auth")
public class LoginController {

	@Autowired
	SellerService sellerService;

	@Autowired
	MemberService memberService;

	@Autowired
	PasswordEncoder passwordEncoder;

	// 로그인 페이지
	@RequestMapping("/login")
	public String loginForm(String error, String logout, Model model) {

		if (error != null) {
			model.addAttribute("error", error);
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃");

		}
		return "auth/loginForm";
	}

	// 로그아웃 페이지

	@RequestMapping("/logout")
	public String logoutForm() {

		return "auth/logoutForm";
	}

	// 아이디,비밀번호 찾기 페이지
	@RequestMapping(value = "/loginSearch", method = RequestMethod.GET)
	public String registerForm(Model model) throws Exception {
		model.addAttribute(new Seller());

		return "auth/loginSearch";

	}

	// 이메일로 아이디 조회
	@ResponseBody
	@GetMapping("emailCheck")
	public String idCheck(String email) throws Exception {

		Seller seller = sellerService.readByUserEmail(email);
		Member member = memberService.readByUserEmail(email);

		if (seller == null && member == null) {
			return "null";

		} else if (member == null) {

			if (email.equals(seller.getS_email())) {
				return seller.getS_id();
			}

		} else {

			if (email.equals(member.getM_mail()) && seller == null) {
				return member.getM_id();
			}
		}
		return "null";

	}

	// 아이디와 이메일 조회
	@ResponseBody
	@GetMapping("pwCheck")
	public int pwCheck(String id, String email) throws Exception {

		Seller sellerById = sellerService.readByUserId(id);
		Seller sellerByEmail = sellerService.readByUserEmail(email);

		Member memberById = memberService.readByUserId(id);
		Member memberByEmail = memberService.readByUserEmail(email);

		if (sellerById == null && sellerByEmail == null && memberById == null && memberByEmail == null) {
			return 1;
		}
		if (memberByEmail == null && memberById == null) {
			if (((sellerById.getS_id()).equals(sellerByEmail.getS_id())
					&& (sellerById.getS_email()).equals(sellerByEmail.getS_email()))) {
				return 0;
			}

		} else if (sellerByEmail == null && sellerById == null) {
			if (((memberById.getM_id()).equals(memberByEmail.getM_id())
					&& (memberById.getM_mail()).equals(memberByEmail.getM_mail()))) {
				return 0;
			}
		}

		return 1;

	}

	// 아이디와 이메일로 비밀번호 재설정
	@ResponseBody
	@GetMapping("isPass")
	public String isPass(String id, String answer) throws Exception {

		String newPw = getTempPw();
		String newEncodedPw = passwordEncoder.encode(newPw);

		Seller seller = sellerService.readByUserId(id);
		Member member = memberService.readByUserId(id);

		if (seller == null && member == null) {
			return "idNull";

		}
		if (seller != null && answer.equals(seller.getS_answer())) {

			sellerService.replacePw(seller.getS_id(), newEncodedPw);
			return newPw;

		}
		log.info(member.getM_answer());
		if (member != null && answer.equals(member.getM_answer())) {

			memberService.replacePw(member.getM_id(), newEncodedPw);
			return newPw;

		}

		return "null";

	}

	public String getTempPw() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String str = "";

		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			str += charSet[idx];
		}
		return str;
	}

	public int validationLogin(Seller loginSeller, String pw) {

		if (loginSeller == null) {
			System.out.println("해당 아이디의 유저가 존재하지 않습니다.");
			return 1;
		}

		if (!passwordEncoder.matches(pw, loginSeller.getS_pw())) {
			System.out.println("비밀번호가 일치하지 않습니다.");
			return 2;
		}

		return 3;
	}

}
