package com.ebookmarket.board.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


public class SearchCriteria extends Criteria {

	private String searchType = "";
	private String keyword = "";
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType="+ searchType +", keyword=" + keyword + "]";
	}
	
	
}
