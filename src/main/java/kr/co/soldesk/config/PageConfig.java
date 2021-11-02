package kr.co.soldesk.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
@EnableSpringDataWebSupport
public class PageConfig extends WebMvcConfigurationSupport {

	 @Override
	    protected void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
	        argumentResolvers.add(new PageableHandlerMethodArgumentResolver());
	        super.addArgumentResolvers(argumentResolvers);
	    }
}
