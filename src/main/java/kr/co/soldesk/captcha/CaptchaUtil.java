package kr.co.soldesk.captcha;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.NumbersAnswerProducer;



public class CaptchaUtil {
	
	public void getImgCaptCha(HttpServletRequest req, HttpServletResponse res) {
		Captcha captcha = new Captcha.Builder(200, 60)
				.addText(new NumbersAnswerProducer(6))
				.addNoise().addNoise().addNoise()
				.addBackground(new GradiatedBackgroundProducer())
				.addBorder()
				.build();
		
		res.setHeader("Cache-Control", "no-cache");
		res.setDateHeader("Expires", 0);
		res.setHeader("Pragma", "no-cache");
		res.addDateHeader("Max-Age", 0);
		res.setContentType("image/png");
		
		CaptchaServletUtil.writeImage(res, captcha.getImage());
		req.getSession().setAttribute("captcha", captcha.getAnswer());
	}
	
	public void getAudioCaptCha(HttpServletRequest req, HttpServletResponse res) {
		String getAnswer = (String) req.getSession().getAttribute("captcha");
		AudioCaptcha ac = new AudioCaptcha.Builder()
				.addAnswer(new SetTextProducer(getAnswer))
				.addVoice()
				.addNoise()
				.build();
		
		res.setHeader("Cache-Control", "no-cache");
		res.setDateHeader("Expires", 0);
		res.setHeader("Pragma", "no-cache");
		res.addDateHeader("Max-Age", 0);
		
		CaptchaServletUtil.writeAudio(res, ac.getChallenge());
		req.getSession().setAttribute("captcha", ac.getAnswer());
	}
	
	

}
