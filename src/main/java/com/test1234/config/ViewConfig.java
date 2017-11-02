package com.test1234.config;

import java.nio.charset.Charset;

import javax.servlet.Filter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
public class ViewConfig extends WebMvcConfigurerAdapter {

	@Bean
	public ViewResolver getViewResolver() {
		System.err.println("viewResolver");
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	// ---------------------------------------
	// @Bean
	// public HttpMessageConverter<String> responseBodyConverter() {
	// return new StringHttpMessageConverter(Charset.forName("UTF-8"));
	// }
	//
	// @Bean
	// public Filter characterEncodingFilter() {
	// CharacterEncodingFilter characterEncodingFilter = new
	// CharacterEncodingFilter();
	// characterEncodingFilter.setEncoding("UTF-8");
	// characterEncodingFilter.setForceEncoding(true);
	// return characterEncodingFilter;
	// }
}
