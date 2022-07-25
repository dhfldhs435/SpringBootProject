package com.ebookmarket.client.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member {

	private int m_num; // 일반회원 일련번호

	// @NotEmpty(message = "아이디를 입력해주세요")
	// @Pattern(regexp = "^[a-zA-Z0-9]{8,20}$", message = "아이디는 영문/숫자포함 8~20자만
	// 사용가능합니다")
	private String m_id; // 일반회원 아이디

	// @NotEmpty(message = "비밀번호를 입력해주세요")
	// @Pattern(regexp = "^[a-zA-Z0-9]{8,20}$", message = "비밀번호는 영문/숫자포함 8~20자만
	// 사용가능합니다")
	private String m_pw; // 일반회원 비밀번호

	// @NotEmpty(message = "이름을 입력해주세요")
	// @Pattern(regexp = "[가-힣]{1,10}", message = "이름은 한글10자이내로 사용가능합니다")
	private String m_name; // 일반회원 이름

	private String m_resident_num; // 일반회원 주민등록번호 6자리

	// 이메일 주소 형식인지 검사한다
	// @NotEmpty(message = "이메일을 입력해주세요")
	// @Pattern(regexp =
	// "[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}",
	// message = "이메일은 @포함 영문/숫자 10~50자만 사용 가능합니다")
	// @Email
	private String m_mail; // 일반회원 이메일

	private Date m_join_date; // 일반회원 가입일자
	private boolean m_content_agree;// 컨텐츠 이용약관 동의 여부
	private boolean m_privaty_agree;// 개인정보 이용약관 동의 여부
	private boolean m_refund_agree; // 환불정책 이용약관 동의 여부

	private String m_answer; // 일반 회원가입시 입력한 정답

	private List<MemberAuth> authList;
}
