package com.recruit.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 * 登陆过滤器，如果未登录或者session过期，跳转到登陆界面
 */
@WebFilter(value="/*", initParams={@WebInitParam(name = "uri", value = "/user/personalCenter,/resume/addResume,/resume/applyJob,/user/addComment,/firm/myCenter,/firm/myFirm,/firm/insertMyFirm,/firm/updateMyFirm,/firm/jobsList,/firm/resumesList,/firm/firmIndex,/job/createJob,/job/createJobDo,/job/viewJob,/job/updateJob,/job/updateJobDo,/job/deleteJob,/admin/firm,/admin/user,/admin/job,/admin/comments,/admin/resume,/admin/deleteFirm,/admin/deleteComments,/admin/deleteJob,/admin/deleteResume,/admin/deleteUser,/admin/updateUser,/admin/pager,/admin/search,/admin/main") })
public class LoginFilter implements Filter {

	private List<String> urls;
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
		HttpServletResponse res = (HttpServletResponse) response;
		String uri = req.getRequestURI();
		uri = uri.replaceAll(req.getContextPath(), "");
		if(urls.contains(uri)) {
			HttpSession session = req.getSession();
			Object user = session.getAttribute("CUR_USER");
			if(user != null) {
				chain.doFilter(request, response);
			}else {
				res.sendRedirect(req.getContextPath()+"/user/login");
			}
		}else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		String uri = fConfig.getInitParameter("uri");
		String[] strs = uri.split(",");
		urls = Arrays.asList(strs);
	}

}
