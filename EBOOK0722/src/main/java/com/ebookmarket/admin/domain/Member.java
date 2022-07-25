package com.ebookmarket.admin.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member {

	private Integer m_num; // 일반회원 일련번호
	private String m_id; // 일반회원 아이디
	private String m_pw; // 일반회원 비밀번호
	private String m_name; // 일반회원 이름
	private String m_resident_num; // 일반회원 주민등록번호
	private Date m_join_date; // 일반회원 가입일자
	private char m_content_agree; // 컨텐츠 이용약관 동의여부
	private char m_privaty_agree; // 개인정보 이용약관 동의여부
	private char m_refund_agree; // 환불정책 이용약관 동의여부
	private String m_mail; // 일반회원 이메일
	private String m_answer; // 일반회원 비밀번호 질문답

}
