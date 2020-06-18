package com.tea.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.IOException;

@WebFilter(filterName = "SystemFilter", urlPatterns = "/*")
public class SystemFilter implements Filter {

	private static final Logger logger = LoggerFactory.getLogger(SystemFilter.class);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		//String token = req.getHeader("token");
		//驗證JWT待開發...
		//logger.debug("filter start");
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
	}
}