package kr.co.soldesk.captcha;

import nl.captcha.text.producer.TextProducer;

public class SetTextProducer implements TextProducer {

	private final String str;
	
	public SetTextProducer(String getAnswer) {
		this.str = getAnswer;
	}
		
	@Override
	public String getText() {
		// TODO Auto-generated method stub
		return this.str;
	}

}
