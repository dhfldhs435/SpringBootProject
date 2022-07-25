package com.ebookmarket.admin.mapper;

import java.util.List;

import com.ebookmarket.admin.domain.CreationInfo;
import com.ebookmarket.admin.domain.CreationList;

public interface CreationMapper {
	// 등록된 창작물 목록
	public List<CreationList> reglist() throws Exception;

	// 삭제된 창작물 목록
	public List<CreationList> dellist() throws Exception;

	// 창작물 등록대기 목록
	public List<CreationList> regapplist() throws Exception;

	// 창작물 등록정보
	public CreationInfo reginfo(Integer e_num) throws Exception;

	// 창작물 등록승인
	public void regapproval(CreationInfo creationInfo) throws Exception;
	
	// 창작물 등록거절
	public void regrefuse(CreationInfo creationInfo) throws Exception;

	// 창작물 삭제대기 목록
	public List<CreationList> delapplist() throws Exception;

	// 창작물 삭제정보
	public CreationInfo delinfo(Integer e_num) throws Exception;

	// 창작물 삭제승인
	public void delapproval(CreationInfo creationInfo) throws Exception;

	// 미리보기 이미지 표시
	public String getPreview(Integer e_num) throws Exception;
}
