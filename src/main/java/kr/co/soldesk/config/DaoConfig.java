package kr.co.soldesk.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@PropertySource("classpath:db/props/application.properties")
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = {
		"kr.co.soldesk.repository" }, transactionManagerRef = "jpatransactionManager")
@ComponentScan(basePackages = { "kr.co.soldesk.repository" })
public class DaoConfig {
	
	@Autowired
	private Environment env; 
	
	private Properties getHibernateProperties() {

		Properties prop = new Properties();
		prop.put("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
		prop.put("hibernate.show_sql", "true");
		prop.put("hibernate.format_sql", "false");
		prop.put("hibernate.order_inserts", "true");
		prop.put("hibernate.order_updates", "true");
		prop.put("hibernate.jdbc.batch_size", 100);
		prop.put("hibernate.jdbc.batch_versioned_data", "true");

		return prop;
	}

	@Bean("jpadataSource")
	public BasicDataSource jpadataSource() {
		
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(env.getProperty("jdbc.driverClassName"));
		ds.setUrl(env.getProperty("jdbc.url"));
		ds.setUsername(env.getProperty("jdbc.username"));
		ds.setPassword(env.getProperty("jdbc.password"));
		
		return ds;
	}


	@Bean("entityManagerFactory")
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {

		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		em.setDataSource(jpadataSource());
		em.setPackagesToScan(new String[] { "kr.co.soldesk.domain" });
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		em.setJpaVendorAdapter(vendorAdapter);
		em.setJpaProperties(getHibernateProperties());
		return em;

	}

	@Bean("jpatransactionManager")
	public PlatformTransactionManager jpatransactionManager() {

		JpaTransactionManager jpaTransactionManager = new JpaTransactionManager();
		jpaTransactionManager.setEntityManagerFactory((EntityManagerFactory) entityManagerFactory().getObject());

		return jpaTransactionManager;
	}
	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
}
