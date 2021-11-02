package kr.co.soldesk.service;

import java.util.Locale;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kr.co.soldesk.model.ContentDto;
import kr.co.soldesk.model.Contents;
import kr.co.soldesk.model.Users;

public interface ContentDetailsService{
	
	public void addContent(ContentDto writeContent,Users user,Locale locale);
	
	//public List<Contents> getContentList();
	
	Contents readContent(int contentIdx);
	
	void deleteContent(int contentIdx); //글 삭제

	void modifyContent(String subject, String text, int contentIdx);
	
	void getCount(int contentIdx);
	
	Page<Contents> paging(Pageable pageable,String field,String word);
	
	void insertContent(String subject, String text, Users writerIdx,int count, String open);
	
}
