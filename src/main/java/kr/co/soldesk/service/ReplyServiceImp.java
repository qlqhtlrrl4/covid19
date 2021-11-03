package kr.co.soldesk.service;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.model.Reply;
import kr.co.soldesk.repository.ReplyRepository;

@Service("replyService")
public class ReplyServiceImp {

	@Autowired
	private ReplyRepository replyRepository;

	@Autowired
	private TextTrans textTrans;

	public void addReply(Reply writeReply, String userName, Locale locale) {

		Reply reply = new Reply();
		if (locale.getLanguage().equals("ko")) {
			reply.setContentIdx(writeReply.getContentIdx());
			reply.setContent(writeReply.getContent());
			reply.setName(userName);
			
			reply.setEncontent(textTrans.translateEn(writeReply.getContent()));
			
		} else if (locale.getLanguage().equals("en")) {
			
			reply.setContentIdx(writeReply.getContentIdx());
			reply.setEncontent(writeReply.getContent());
			reply.setName(userName);
			
			reply.setContent(textTrans.translateKo(writeReply.getContent()));
		}
		
		replyRepository.save(reply);
	}

	public List<Reply> readReply(int contentIdx) {
		return replyRepository.readReply(contentIdx);
	}

	public void deleteReply(int replyIdx) {
		replyRepository.deleteReply(replyIdx);
	}

	public List<Reply> findAll() {
		return replyRepository.findAll();
	}

}
