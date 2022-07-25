package com.ebookmarket.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.admin.domain.AdminCategory;
import com.ebookmarket.admin.service.AdminCategoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	@Autowired
	private AdminCategoryService service;

	// 등록 페이지
	@RequestMapping(value = "/creationCategory", method = RequestMethod.GET)
	public void registerForm(Model model) throws Exception {
		AdminCategory adminCategory = new AdminCategory();
		model.addAttribute(adminCategory);
		model.addAttribute("list", service.list());
		log.info("카테고리 변경 메인 페이지");
	}

	// 등록 처리
	@RequestMapping(value = "/creationCategory", method = RequestMethod.POST)
	public String register(AdminCategory category, RedirectAttributes rttr) throws Exception {
		service.register(category);
		rttr.addFlashAttribute("msg", "SUCCESS");
		log.info("카테고리 등록 완료");
		return "redirect:/admin/category/creationCategory";
	}

	// 목록 페이지
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.list());
		log.info("카테고리 목록");
	}

	// 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(String category_code, Model model) throws Exception {
		model.addAttribute(service.read(category_code));
		log.info("상세 페이지");
	}

	// 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyForm(String category_code, Model model) throws Exception {
		model.addAttribute(service.read(category_code));
		log.info("카테고리 수정 페이지");
	}

	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(AdminCategory category, RedirectAttributes rttr) throws Exception {
		service.modify(category);
		rttr.addFlashAttribute("msg", "SUCCESS");
		log.info("카테고리 수정 완료");
		return "redirect:/admin/category/creationCategory";
	}

	// 삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(String category_code, RedirectAttributes rttr) throws Exception {
		service.remove(category_code);
		rttr.addFlashAttribute("msg", "SUCCESS");
		log.info("카테고리 삭제 완료");
		return "redirect:/admin/category/creationCategory";
	}

}
