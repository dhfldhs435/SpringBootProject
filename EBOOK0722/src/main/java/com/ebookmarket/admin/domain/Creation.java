package com.ebookmarket.admin.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Creation {

	
	private Integer e_num;	// 창작물 일련번호
	private String e_title;	// 창작물 제목
	private String e_rating;	// 창작물 평점
	private Date e_reg_date;	// 창작물 등록일자
	private String e_post_introduce;	// 창작물 소개
	private String e_coverimage_url;	// 창작물 표지이미지파일경로
	private String e_profile;	// 창작물 저자소개
	private Integer e_age_limit;	// 창작물 연령제한
	private Integer e_refund_cnt;	// 창작물 환불횟수
	private String e_category;	// 창작물 카테고리
	private String e_writer;		// 창작물 작가
	private Integer e_price;		// 창작물 가격
	private String e_attachment_url;	// 창작물 첨부파일경로
	private String e_attachment_type;	// 창작물 첨부파일유형
	private String e_thumbnail_url;	// 창작물 미리보기이미지경로
	private String e_table_content;	// 창작물 목차
	private Integer e_view_cnt;		// 창작물 조횟수
	private Integer e_sell_cnt;		// 창작물 판매횟수
	private Integer e_download_cnt;	// 창작물 다운로드횟수
	private Integer s_num;			// 판매자회원 일련번호
	private char e_reg_approval;		// 창작물 등록 승인여부
	private char e_del_approval;		// 창작물 삭제 승인여부
		
	/*
	private Integer	e_num;
	private String e_category;
	private String e_title;
	private String e_thumbnail_url;
	private Date e_reg_date;
	*/
}
