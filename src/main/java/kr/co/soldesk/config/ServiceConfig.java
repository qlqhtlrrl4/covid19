package kr.co.soldesk.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"kr.co.soldesk.service","kr.co.soldesk.util"})
public class ServiceConfig {

}
