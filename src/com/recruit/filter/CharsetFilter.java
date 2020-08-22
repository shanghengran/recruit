package com.recruit.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import com.recruit.util.StringUtils;

/**
 * Servlet Filter implementation class CharsetFilter
 * 字符转换过滤器
 */
@WebFilter("/CharsetFilter")
public class CharsetFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CharsetFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		if(req.getMethod().equals("get")) {
			req = new charset(req);
		}else {
			req.setCharacterEncoding("utf-8");
		}
		HttpServletResponse res = (HttpServletResponse) response;
		chain.doFilter(req, res);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}
	
	class charset extends HttpServletRequestWrapper{

		public charset(HttpServletRequest request) {
			super(request);
		}
		//获取参数，字符转换
		public String getParameter(String name) {
			String value = super.getParameter(name);
			if(StringUtils.isNotNull(value)) {
				try {
					value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			return value;
		}
	}

}
