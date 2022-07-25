package com.ebookmarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.admin.domain.CreationInfo;
import com.ebookmarket.admin.domain.CreationList;
import com.ebookmarket.admin.mapper.CreationMapper;

@Service
public class CreationServiceImpl implements CreationService {

	@Autowired
	private CreationMapper mapper;

	// 등록된 창작물 목록
	@Override
	public List<CreationList> regList() throws Exception {
		return mapper.reglist();
	}

	// 삭제된 창작물 목록
	@Override
	public List<CreationList> delList() throws Exception {
		return mapper.dellist();
	}

	// 창작물 등록대기 목록
	@Override
	public List<CreationList> regAppList() throws Exception {
		return mapper.regapplist();
	}

	// 창작물 등록정보
	@Override
	public CreationInfo regInfo(Integer e_num) throws Exception {
		return mapper.reginfo(e_num);
	}

	// 창작물 등록승인
	@Override
	public void regApproval(CreationInfo creationInfo) throws Exception {
		mapper.regapproval(creationInfo);
	}

	// 창작물 등록거절
	@Override
	public void regRefuse(CreationInfo creationInfo) throws Exception {
		mapper.regrefuse(creationInfo);
	}

	// 창작물 삭제대기 목록
	@Override
	public List<CreationList> delAppList() throws Exception {
		return mapper.delapplist();
	}

	// 창작물 삭제정보
	@Override
	public CreationInfo delInfo(Integer e_num) throws Exception {
		return mapper.delinfo(e_num);
	}

	// 창작물 삭제승인
	@Override
	public void delApproval(CreationInfo creationInfo) throws Exception {
		mapper.delapproval(creationInfo);
	}

	// 미리보기 이미지 표시
	@Override
	public String getPreview(Integer e_num) throws Exception {
		return mapper.getPreview(e_num);
	}
}
