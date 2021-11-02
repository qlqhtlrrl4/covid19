package kr.co.soldesk.model;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
public class ContentDto {

	private int contentIdx;
	private String subject;
	private String text;
	private Users writerIdx;
	private String date;
	private int count;
	private String open;
	private String writer;
	private String answer;
	
}
