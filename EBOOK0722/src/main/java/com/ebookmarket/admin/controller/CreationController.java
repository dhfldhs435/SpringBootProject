package com.ebookmarket.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.admin.domain.CreationInfo;
import com.ebookmarket.admin.domain.CreationList;
import com.ebookmarket.admin.service.CreationService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/creation")
public class CreationController {

	@Autowired
	private CreationService service;

	@Value("${upload.path}")
	private String uploadPath;

	// 등록된 창작물 목록 페이지
	@RequestMapping(value = "/regList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void regList(Model model) throws Exception {
		List<CreationList> regList = service.regList();
		model.addAttribute("regList", regList);

	}

	// 삭제된 창작물 목록 페이지
	@RequestMapping(value = "/delList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void delList(Model model) throws Exception {
		List<CreationList> delList = service.delList();
		model.addAttribute("delList", delList);

	}

	// 창작물 등록대기 페이지
	@RequestMapping(value = "/regAppList", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public void regAppList(Model model) throws Exception {
		List<CreationList> regAppList = service.regAppList();
		model.addAttribute("regAppList", regAppList);
	}

	// 창작물 등록 정보
	@RequestMapping(value = "/regInfo", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String regInfo(Integer e_num, Model model) throws Exception {
		CreationInfo creation = service.regInfo(e_num);

		model.addAttribute("creation", creation);

		return "creation/regInfo";
	}

	// 창작물 등록 승인처리
	@RequestMapping(value = "/regApproval", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String regApproval(CreationInfo creationInfo, RedirectAttributes rttr) throws Exception {
		service.regApproval(creationInfo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/creation/regList";
	}

	// 창작물 등록 거절처리
	@RequestMapping(value = "/regRefuse", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String regRefuse(CreationInfo creationInfo, RedirectAttributes rttr) throws Exception {
		service.regRefuse(creationInfo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/creation/regList";
	}

	// 창작물 삭제대기 페이지
	@RequestMapping(value = "/delAppList", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public void delAppList(Model model) throws Exception {
		List<CreationList> delAppList = service.delAppList();
		model.addAttribute("delAppList", delAppList);
	}

	// 창작물 삭제 정보
	@RequestMapping(value = "/delInfo", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String delInfo(Integer e_num, Model model) throws Exception {
		CreationInfo creation = service.delInfo(e_num);

		model.addAttribute("creation", creation);

		return "creation/delInfo";
	}

	// 창작물 삭제 승인처리
	@RequestMapping(value = "/delApproval", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String delApproval(CreationInfo creationInfo, RedirectAttributes rttr) throws Exception {
		service.delApproval(creationInfo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/creation/delList";
	}

	// 카테고리 변경 페이지
	@RequestMapping(value = "/category")
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public void category() {
		log.info("category : 로그인한 최고관리자만 접근 가능");
	}

	// 미리보기 이미지 표시
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(Integer e_num) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String fileName = service.getPreview(e_num);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + File.separator + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	// 파일 확장자로 이미지 형식 확인
	private MediaType getMediaType(String formatName) {
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}

		return null;
	}

}
