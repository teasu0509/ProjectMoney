package com.tea.web.config;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
@ComponentScan(basePackages = { "com.tea.**.action" })
@EnableWebMvc
public class WebMvcConfig extends WebMvcConfigurerAdapter {

  @Override
  public void addViewControllers(ViewControllerRegistry registry) {
    super.addViewControllers(registry);
    registry.addViewController("/errors/sysError500").setViewName("/errors/sysError500");
    registry.addViewController("/errors/sysError404").setViewName("/errors/sysError404");
  }

  @Override
  public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
    configurer.enable();
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
  }

  @Override
  public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
    converters.add(new StringHttpMessageConverter());
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/resources/**").addResourceLocations("/resources/")
        .setCachePeriod(Math.toIntExact(TimeUnit.DAYS.toSeconds(365L)));
  }

  @Bean
  public TilesViewResolver tilesViewResolver() {
    TilesViewResolver tilesViewResolver = new TilesViewResolver();
    tilesViewResolver.setViewClass(TilesView.class);
    return tilesViewResolver;
  }

  @Bean
  public TilesConfigurer tilesConfigurer() {
    TilesConfigurer tilesConfigurer = new TilesConfigurer();
    tilesConfigurer.setCheckRefresh(true);
    tilesConfigurer.setDefinitions("/WEB-INF/layouts/**/tiles.xml", "/WEB-INF/views/**/tiles.xml");
    return tilesConfigurer;
  }

}
