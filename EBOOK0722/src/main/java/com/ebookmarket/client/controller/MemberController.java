package com.ebookmarket.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.security.domain.CustomUser;
import com.ebookmarket.client.service.MemberService;
import com.ebookmarket.client.service.SellerService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired
	private SellerService sellerService;

	// 스프링 시큐리티 비밀번호 암호처리기
	@Autowired
	private PasswordEncoder passwordEncoder;

	// 일반회원 가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinForm(@ModelAttribute Member member, Model model) throws Exception {

	}

	// 회원가입 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@Validated Member member, BindingResult result, Model model, RedirectAttributes rttr)
			throws Exception {

		log.info("join");

		if (result.hasErrors()) {
			return "member/join";
		}

		// 비밀번호 암호화
		String inputPassword = member.getM_pw();
		member.setM_pw(passwordEncoder.encode(inputPassword));

		service.join(member);

		rttr.addFlashAttribute("m_name", member.getM_name());
		return "redirect:/member/joinSuccess";
	}

	// 회원가입 성공 페이지
	@RequestMapping(value = "/joinSuccess", method = RequestMethod.GET)
	public void joinSuccess(Model model) throws Exception {

	}

	// 계정 정보 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String read(@AuthenticationPrincipal CustomUser customUser, Model model) throws Exception {

		String userId = customUser.getUsername();

		Member member = service.readByUserId(userId);

		model.addAttribute(member);

		return "member/read";

	}

	// 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String modifyForm(Integer m_num, Model model) throws Exception {

		Member member = new Member();
		member.setM_num(m_num);
		model.addAttribute(member);

		return "member/modify";

	}

	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String modify(@Validated Member member) throws Exception {

		Member originalMember = service.readByUserNum(member.getM_num());

		if (member.getM_pw().isEmpty()) {
			member.setM_pw(originalMember.getM_pw());
		} else {
			// 비밀번호 암호화
			String inputPasswordString = member.getM_pw();
			member.setM_pw(passwordEncoder.encode(inputPasswordString));
		}

		if (member.getM_mail().isEmpty()) {
			member.setM_mail(originalMember.getM_mail());
		}
		service.modify(member);

		return "redirect:/";

	}

	// 아이디 중복체크
	@ResponseBody
	@GetMapping("idCheck")
	public int overlappedID(String id) throws Exception {
		int result = service.overlappedID(id);
		if (result == 0) {
			result = sellerService.overlappedID(id);
		}
		return result;
	}

	// 이메일 중복 검사
	@ResponseBody
	@GetMapping("emailCheck")
	public int overlappedEmail(String email) throws Exception {

		if (email.length() == 0) {
			return 2;

		} else {
			int result = service.overlappedEmail(email);
			if (result == 0) {
				result = sellerService.overlappedEmail(email);
			}

			return result;
		}
	}

	// 컨텐츠 이용약관 페이지
	@RequestMapping(value = "/contentAgree", method = RequestMethod.GET)
	public void contentAgree(Model model) throws Exception {

	}

	// 개인정보 이용동의 약관 페이지
	@RequestMapping(value = "/privatyAgree", method = RequestMethod.GET)
	public void privatyAgree(Model model) throws Exception {

	}

	// 환불 정책 페이지
	@RequestMapping(value = "/refundAgree", method = RequestMethod.GET)
	public void refundAgree(Model model) throws Exception {

	}

	// 메인페이지로 돌아가기
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String reset(Model model) throws Exception {

		return "/";
	}

}
