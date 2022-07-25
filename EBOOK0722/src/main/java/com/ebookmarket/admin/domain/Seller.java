package com.ebookmarket.admin.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Seller {

	private Integer s_num;	// 판매자회원 일련번호
	private String s_id;		// 판매자회원 아이디
	private String s_pw;		// 판매자회원 비밀번호
	private String s_nickname;	// 판매자회원 닉네임
	private String s_profile_imgurl;	// 판매자회원 프로필이미지
	private String s_name;		// 판매자회원 이름
	private String s_resident_num;	// 판매자회원 주민등록번호
	private String s_email;		// 판매자회원 이메일
	private String s_phone;		// 판매자회원 휴대폰번호
	private Date s_join_date;		// 판매자회원 가입일자
	private char s_seller_agree;	// 판매약관 동의여부
	private char s_content_agree;	// 컨텐츠 등록약관 동의여부
	private char s_privaty_agree;	// 개인정보 이용약관 동의여부
	private String s_address;	// 판매자회원 주소
	private String s_bank_name;	// 판매자회원 은행명
	private String s_accont_num;	// 판매자회원 계좌번호
	private String s_ah_name;		// 판매자회원 예금주성명
	private String s_certificate_detail;	// 판매자회원 자격증 세부사항
	private String s_certificate_dataurl;	// 판매자회원 자격증 증빙자료경로
	private String s_career_detail;		// 판매자회원 경력 수상이력
	private String s_career_dataurl;		// 판매자회원 경력 수상증빙자료경로
	private String s_grade;		// 판매자회원 등급
	private String s_answer;	// 판매자회원 비밀번호 질문답
	
}
