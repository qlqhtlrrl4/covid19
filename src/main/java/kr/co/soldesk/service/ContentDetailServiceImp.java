package kr.co.soldesk.service;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.soldesk.model.ContentDto;
import kr.co.soldesk.model.Contents;
import kr.co.soldesk.model.Users;
import kr.co.soldesk.repository.ContentRepository;

@Service("contentDetailService")
public class ContentDetailServiceImp implements ContentDetailsService {

	@Autowired
	private ContentRepository contentRepository;

	@Autowired
	private TextTrans textTrans;

	/*
	 * @Override public List<Contents> getContentList() { return
	 * contentRepository.getContentList(); }
	 */

	@Autowired
	@Qualifier("userDetailsService")
	private CustomUserDetailsService userService;

	@Override
	public void addContent(ContentDto writeContent, Users users, Locale locale) {

		Contents content = new Contents();
		
		if (locale.getLanguage().equals("ko")) {
			content.setSubject(writeContent.getSubject());
			content.setText(writeContent.getText());
			content.setWriterIdx(users);
			content.setOpen(writeContent.getOpen());
			content.setWriter(users.getName());
			
			content.setEnsubject(textTrans.translateEn(writeContent.getSubject()));
			content.setEntext(textTrans.translateEn(writeContent.getText()));
		
		
		} else if (locale.getLanguage().equals("en")) {
			
			content.setSubject(textTrans.translateKo(writeContent.getSubject()));
			content.setText(textTrans.translateKo(writeContent.getText()));
			content.setWriterIdx(users);
			content.setOpen(writeContent.getOpen());
			content.setWriter(users.getName());
			
			
			content.setEnsubject(writeContent.getSubject());
			content.setEntext(writeContent.getText());
		}

		contentRepository.save(content);
	}

	@Override
	public Contents readContent(int contentIdx) {
		return contentRepository.readContent(contentIdx);
	}

	@Override
	public void modifyContent(String subject, String text, int contentIdx) {
		contentRepository.modifyContent(subject, text, contentIdx);
	}

	@Override
	public void deleteContent(int contentIdx) {
		contentRepository.deleteContent(contentIdx);
	}

	@Transactional
	@Override
	public void getCount(int contentIdx) {
		contentRepository.getCount(contentIdx);

	}

	@Override
	public Page<Contents> paging(Pageable pageable, String field, String word) {

		Page<Contents> contentlist = contentRepository.findAll(pageable);
		if (field.equals("subject")) {
			contentlist = contentRepository.findBySubjectContaining(word, pageable);
		} else if (field.equals("text")) {
			contentlist = contentRepository.findByTextContaining(word, pageable);
		} else if (field.equals("writer")) {
			contentlist = contentRepository.findByWriterContaining(word, pageable);
		}

		return contentlist;
	}

	@Override
	public void insertContent(String subject, String text, Users writerIdx, int count, String open) {

		contentRepository.insertContent(subject, text, writerIdx, count, open);
	}

}
