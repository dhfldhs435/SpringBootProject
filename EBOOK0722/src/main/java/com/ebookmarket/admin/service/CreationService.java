package com.ebookmarket.admin.service;

import java.util.List;

import com.ebookmarket.admin.domain.CreationInfo;
import com.ebookmarket.admin.domain.CreationList;

public interface CreationService {
	// 등록된 창작물 목록
	public List<CreationList> regList() throws Exception;

	// 삭제된 창작물 목록
	public List<CreationList> delList() throws Exception;

	// 창작물 등록대기 목록
	public List<CreationList> regAppList() throws Exception;

	// 창작물 등록정보
	public CreationInfo regInfo(Integer e_num) throws Exception;

	// 창작물 등록승인
	public void regApproval(CreationInfo creationInfo) throws Exception;

	// 창작물 등록거절
	public void regRefuse(CreationInfo creationInfo) throws Exception;

	// 창작물 삭제대기 목록
	public List<CreationList> delAppList() throws Exception;

	// 창작물 삭제정보
	public CreationInfo delInfo(Integer e_num) throws Exception;

	// 창작물 삭제승인
	public void delApproval(CreationInfo creationInfo) throws Exception;

	// 미리보기 이미지 표시
	public String getPreview(Integer e_num) throws Exception;
}
