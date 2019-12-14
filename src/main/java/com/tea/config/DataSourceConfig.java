package com.tea.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class DataSourceConfig {

	@Value("${db.driver}")
	private String driver;

	@Value("${db.url}")
	private String url;

	@Value("${db.username}")
	private String username;

	@Value("${db.password}")
	private String password;

	@Bean(destroyMethod = "close")
	DataSource dataSource() {
		HikariConfig dataSourceConfig = new HikariConfig();
		dataSourceConfig.setDriverClassName(driver);
		dataSourceConfig.setJdbcUrl(url);
		dataSourceConfig.setUsername(username);
		dataSourceConfig.setPassword(password);
		return new HikariDataSource(dataSourceConfig);
	}

}
