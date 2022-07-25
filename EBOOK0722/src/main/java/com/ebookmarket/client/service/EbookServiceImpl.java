package com.ebookmarket.client.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ebookmarket.client.domain.Ebook;
import com.ebookmarket.client.mapper.EbookMapper;

@Service
public class EbookServiceImpl implements EbookService {

	@Autowired
	private EbookMapper mapper;

	@Override
	public void register(Ebook ebook) throws Exception {
		mapper.create(ebook);

	}

	@Override
	public List<Ebook> list() throws Exception {

		return mapper.list();
	}

	@Override
	public Ebook read(Integer e_num) throws Exception {
		mapper.view_cnt(e_num);
		return mapper.read(e_num);
	}

	@Override
	public void remove(int e_num) throws Exception {

		mapper.delete(e_num);
	}

	@Override
	public String getCover(Integer e_num) throws Exception {

		return mapper.getCover(e_num);
	}

	@Override
	public String getPreview(Integer e_num) throws Exception {

		return mapper.getPreview(e_num);
	}

	@Override
	public List<Ebook> uploadList(Integer s_num) throws Exception {

		return mapper.uploadList(s_num);
	}

}
