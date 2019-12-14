package com.tea.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;

@Configuration
@ComponentScan(basePackages = { "com.tea.config", "com.tea.**.service" })
public class AppConfig {

	@Bean
	public static PropertySourcesPlaceholderConfigurer properties() throws Exception {
		PropertySourcesPlaceholderConfigurer pspc = new PropertySourcesPlaceholderConfigurer();
		ClassPathResource serverConfig = new ClassPathResource("cfg/Server.properties");
		pspc.setLocations(serverConfig);
		return pspc;
	}
}
