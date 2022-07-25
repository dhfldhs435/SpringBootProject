package com.ebookmarket.faqboard.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/faqboard")
public class FaqBoardController {

	@RequestMapping(value = "/memberFaqList", method = RequestMethod.GET)
	public String memberFaqList(Locale locale, Model model) {


		return "faqboard/memberFaqList";
	}
	
	@RequestMapping(value = "/sellerFaqList", method = RequestMethod.GET)
	public String sellerFaqList(Locale locale, Model model) {


		return "faqboard/sellerFaqList";
	}
	
}
