package com.ebookmarket.client.mapper;

import java.util.List;

import com.ebookmarket.client.domain.Ebook;

public interface EbookMapper {

	public void create(Ebook ebook) throws Exception;

	public List<Ebook> list() throws Exception;

	public Ebook read(Integer e_num) throws Exception;

	public void view_cnt(Integer e_num) throws Exception;

	public void delete(int e_num) throws Exception;

	public String getCover(Integer e_num) throws Exception;

	public String getPreview(Integer e_num) throws Exception;

	public List<Ebook> uploadList(Integer s_num) throws Exception;

}
