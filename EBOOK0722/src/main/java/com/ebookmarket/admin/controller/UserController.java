package com.ebookmarket.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.admin.domain.User;
import com.ebookmarket.admin.service.UserService;

@Controller
@RequestMapping("/admin/user")
public class UserController {

	@Autowired
	private UserService service;

	// 판매자회원 목록 페이지
	@RequestMapping(value = "/sellerList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void sellerList(Model model) throws Exception {
		List<User> sellerList = service.sellerList();
		model.addAttribute("sellerList", sellerList);
	}

	// 일반회원 목록 페이지
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void memberList(Model model) throws Exception {
		List<User> memberList = service.memberList();
		model.addAttribute("memberList", memberList);
	}

	// 탈퇴한 판매자회원 목록 페이지
	@RequestMapping(value = "/sellerResignList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void sellerResignList(Model model) throws Exception {
		List<User> sellerResignList = service.sellerResignList();
		model.addAttribute("sellerResignList", sellerResignList);
	}

	// 탈퇴한 일반회원 목록 페이지
	@RequestMapping(value = "/memberResignList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void memberResignList(Model model) throws Exception {
		List<User> memberResignList = service.memberResignList();
		model.addAttribute("memberResignList", memberResignList);
	}

	// 판매자회원 등급 설정
	@RequestMapping(value = "/setGrade", method = RequestMethod.POST)
	@PreAuthorize("isAuthenticated()")
	public String setGrade(User user, RedirectAttributes rttr) throws Exception {
		service.setGrade(user);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/user/sellerList";
	}

}
