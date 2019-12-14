package com.tea.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
@EnableJpaRepositories(basePackages = { "com.tea.**.repository" })
@ComponentScan(basePackages = "com.tea.**.dao")
public class JpaConfig {

	@Autowired
	private DataSource dataSource;

	@Value("${hibernate.hbm2ddl.auto}")
	private String auto;

	@Value("${hibernate.show_sql}")
	private String showSql;

	@Value("${hibernate.format_sql}")
	private String formatSql;

	@Value("${hibernate.use_sql_comments}")
	private String useSqlComments;

	@Bean
	public EntityManagerFactory entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		HibernateJpaVendorAdapter adapter = new HibernateJpaVendorAdapter();
		adapter.setDatabase(Database.SQL_SERVER);
		adapter.setDatabasePlatform("org.hibernate.dialect.SQLServerDialect");
		em.setJpaVendorAdapter(adapter);
		em.setPackagesToScan("com.tea.**.entity");
		em.setDataSource(dataSource);
		Properties prop = new Properties();
		prop.setProperty("hibernate.hbm2ddl.auto", auto);
		prop.setProperty("hibernate.show_sql", showSql);
		prop.setProperty("hibernate.format_sql", formatSql);
		prop.setProperty("hibernate.use_sql_comments", useSqlComments);
		prop.setProperty("hibernate.cache.use_second_level_cache", "false");
		em.setJpaProperties(prop);
		em.afterPropertiesSet();
		return em.getObject();
	}

	@Bean
	public PlatformTransactionManager transactionManager() {
		JpaTransactionManager tx = new JpaTransactionManager();
		tx.setEntityManagerFactory(entityManagerFactory());
		return tx;
	}

}
