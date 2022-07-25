package com.ebookmarket.client.service;

import java.util.List;

import org.springframework.context.annotation.Primary;

import com.ebookmarket.client.domain.Ebook;

@Primary
public interface EbookService {

	public void register(Ebook ebook) throws Exception;

	public List<Ebook> list() throws Exception;

	public Ebook read(Integer e_num) throws Exception;

	public void remove(int e_num) throws Exception;

	public String getCover(Integer e_num) throws Exception;

	public String getPreview(Integer e_num) throws Exception;

	public List<Ebook> uploadList(Integer s_num) throws Exception;

}
