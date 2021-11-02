package kr.co.soldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.model.Reply;
import kr.co.soldesk.repository.ReplyRepository;

@Service("replyService")
public class ReplyServiceImp {

	@Autowired
	private ReplyRepository replyRepository;
	
	public void addReply(Reply writeReply,String userName) {
		
		Reply reply = new Reply();
		
		reply.setContentIdx(writeReply.getContentIdx());
		reply.setContent(writeReply.getContent());
		reply.setName(userName);
		
		replyRepository.save(reply);
	}
	
	public List<Reply> readReply(int contentIdx) {
		return replyRepository.readReply(contentIdx);
	}
	public void deleteReply(int replyIdx) {
		replyRepository.deleteReply(replyIdx);
	}
	
}
