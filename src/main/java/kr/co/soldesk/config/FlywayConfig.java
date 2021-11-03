package kr.co.soldesk.config;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.configuration.FluentConfiguration;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource("classpath:db/props/application.properties")
public class FlywayConfig {
	
	@Value("${flyway.resourcepath}")
	private String resourcePath;

	@Value("${jdbc.url}")
    private String dataSourceUrl;
	
	@Value("${jdbc.username}")
    private String username;
	
	@Value("${jdbc.password}")
    private String password;

    @Bean("flyway")
    public Flyway flyway() {

        FluentConfiguration fluentConfiguration = Flyway.configure().dataSource(dataSourceUrl, username, password);

        fluentConfiguration.locations(resourcePath);
        System.out.println(resourcePath);

        Flyway flyway = fluentConfiguration
        		.ignoreIgnoredMigrations(true)
        		.outOfOrder(true)
        		.load();

        //flyway.migrate();

        return flyway;
    }
	
}
