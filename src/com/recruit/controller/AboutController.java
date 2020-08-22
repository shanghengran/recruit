package com.recruit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AboutController
 * 关于我们模块 控制器
 */
@WebServlet("/about/*")
public class AboutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AboutController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取协议、主机名、端口号之后的路径 URL=协议+主机名+端口号+URI
				String uri = request.getRequestURI();
				//将URI路径除了操作之前的路径替换为空
				uri = uri.replaceAll(request.getContextPath()+"/about/", "");
				if ("chengnuo".equals(uri)) {
					request.getRequestDispatcher("/WEB-INF/html/chengnuo.jsp").forward(request, response);
				} else if ("duihua".equals(uri)){
					request.getRequestDispatcher("/WEB-INF/html/duihua.jsp").forward(request, response);
				} else if ("fazhan".equals(uri)){
					request.getRequestDispatcher("/WEB-INF/html/fazhan.jsp").forward(request, response);
				} else if ("jianjie".equals(uri)){
					request.getRequestDispatcher("/WEB-INF/html/jianjie.jsp").forward(request, response);
				} else if ("jingying".equals(uri)){
					request.getRequestDispatcher("/WEB-INF/html/jingying.jsp").forward(request, response);
				} else if ("shiming".equals(uri)){
					request.getRequestDispatcher("/WEB-INF/html/shiming.jsp").forward(request, response);
				} else if ("wenhua".equals(uri)){
					request.getRequestDispatcher("/WEB-INF/html/wenhua.jsp").forward(request, response);
				} else if ("zeren".equals(uri)){
					request.getRequestDispatcher("/WEB-INF/html/zeren.jsp").forward(request, response);
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
