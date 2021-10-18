package kr.co.soldesk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.model.Board;
import kr.co.soldesk.repository.BoardRepository;

@Service
public class QnaService {
	
	@Autowired
	private BoardRepository boardRepository;
	
	public void insertBoard(Board board) {
		boardRepository.insertBoard(board.getTitle(), board.getContent());
	}
}