package com.recruit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.recruit.dao.CommentsDao;
import com.recruit.dao.FirmDao;
import com.recruit.dao.JobDao;
import com.recruit.dao.ResumeDao;
import com.recruit.dao.UserDao;
import com.recruit.entity.CommentsEntity;
import com.recruit.entity.FirmEntity;
import com.recruit.entity.JobEntity;
import com.recruit.entity.ResumeEntity;
import com.recruit.entity.UserEntity;
import com.recruit.util.StringUtils;
import com.recruit.entity.Pager;

/**
 * Servlet implementation class AdminController
 * 后台管理模块 控制器
 */
@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//初始化数据库类
    private FirmDao firmDao = new FirmDao();
	private CommentsDao commentsDao = new CommentsDao(); 
	private JobDao jobDao= new JobDao();
	private UserDao userDao= new UserDao();
	private ResumeDao resumeDao= new ResumeDao();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取协议、主机名、端口号之后的路径 URL=协议+主机名+端口号+URI
		String uri = request.getRequestURI();
		//将URI路径除了操作之前的路径替换为空
		uri=uri.replaceAll(request.getContextPath()+"/admin/", "");
		//根据操作名称进行操作
		if("firm".equals(uri)) {
			firm(request,response);
		}else if("user".equals(uri)) {
			user(request,response);
		}else if("job".equals(uri)) {
			job(request,response);
		}else if("comments".equals(uri)) {
			comments(request,response);
		}else if("resume".equals(uri)) {
			resume(request,response);
		}else if("deleteFirm".equals(uri)) {
			deleteFirm(request,response);
		}else if("deleteComments".equals(uri)) {
			deleteComments(request,response);
		}else if("deleteJob".equals(uri)) {
			deleteJob(request,response);
		}else if("deleteResume".equals(uri)) {
			deleteResume(request,response);
		}else if("deleteUser".equals(uri)) {
			deleteUser(request,response);
		}else if("updateUser".equals(uri)) {
			updateUser(request,response);
		}else if("updateUserDo".equals(uri)) {
			updateUserDo(request,response);
		}else if("login".equals(uri)) {
			login(request,response);
		}else if("loginDo".equals(uri)) {
			loginDo(request,response);
		}else if("main".equals(uri)) {
			main(request,response);
		}else if("pager".equals(uri)) {
			main(request,response);
		}else if("quit".equals(uri)) {
			quit(request,response);
		}else{
			response.sendRedirect(request.getContextPath()+"/admin/login");
		}
	}
	
	/**
	 * 退出管理员
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void quit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		//清楚当前用户session
		session.removeAttribute("CUR_USER");
		response.sendRedirect(request.getContextPath()+"/admin/login");
	}

	/**
	 * 管理员主页
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/adminjsp/main.jsp").forward(request, response);
	}

	/**
	 * 执行更新用户
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void updateUserDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = getServletContext().getRealPath("/photo");
		File dir = new File(path);
		//如果没有就创建
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//定义并初始化参数s
		String fileName = null;
		String uid = null;
		String username = null;
		String password = null;
		try {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(request);
			//遍历参数
			for(int i=0;i<items.size();i++){
				FileItem item = items.get(i);
				if (item.isFormField()) { // 如果表单是普通表单数据
					//===不能动结束
				       String fieldName = item.getFieldName();
				       if(fieldName.equals("uid")) {
				    	 //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
				    	   uid = item.getString();
				       }else if (fieldName.equals("password")){
				    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
				    	   password = StringUtils.toUTF8(item.getString());
				       }else if (fieldName.equals("username")){
				    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
				    	   username = StringUtils.toUTF8(item.getString());
				       }
				 }else{ // 如果是文件数据
					 //=====不能动开始
					//文件的真实名字
					 String name = item.getName();
					 if(StringUtils.isNotNull(name)) {
						 //UUID 128位  将文件真实名称改为UUID名称
						 fileName = UUID.randomUUID().toString();
						 String suff = name.substring(name.lastIndexOf("."));
						 fileName += suff;
						 OutputStream fos = new FileOutputStream(new File(path,fileName));  
						 InputStream in = item.getInputStream();   
						 byte[] buffer = new byte[1024];
						 int len = -1;      
						 while ((len = in.read(buffer)) != -1) { 
						     fos.write(buffer,0,len);
						 }      
						 in.close(); fos.close();
					 }
					 //====不能动结束
				 }
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		//如果照片为空 则还是原照片
		if (!StringUtils.isNotNull(fileName)) {
			fileName = "default.png";
		}
		//创建用户对象并赋值
		UserEntity user = new UserEntity();
		user.setUid(Integer.parseInt(uid));
		user.setPhoto(fileName);
		user.setUsername(username);
		user.setPassword(password);
		//进行修改操作
		if(userDao.updateUser(user)) {
			response.sendRedirect(request.getContextPath()+"/admin/user");
		}else{
			response.sendRedirect(request.getContextPath()+"/admin/user");
		}
	}

	/**
	 * 公司查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void firm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String pageNow = request.getParameter("pageNow");
		if(!StringUtils.isNotNull(pageNow)) {
			pageNow = "1";
		}
		//初始化分页对象
		Pager<FirmEntity> pager = new Pager<>();
		//设置当前页
		pager.setPageNow(Integer.parseInt(pageNow));
		//设置总数量
		pager.setTotalCount(firmDao.selectTotalCount());
		//设置页面数量
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		//分页操作
		pager = firmDao.selectFirm(pager);
		//将分页数据传入请求作用域
		session.setAttribute("pager", pager);
		request.getRequestDispatcher("/WEB-INF/adminjsp/firm.jsp").forward(request, response);
	}
	/**
	 * 删除公司
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void deleteFirm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fid = request.getParameter("fid");
		  //删除公司
		  firmDao.deleteFirm(Integer.parseInt(fid));
		  response.sendRedirect(request.getContextPath()+"/admin/firm");
		
	}
	  
	/**
	 * 评论查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void comments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String pageNow = request.getParameter("pageNow");
		if(!StringUtils.isNotNull(pageNow)) {
			pageNow = "1";
		}
		//初始化分页对象
		Pager<CommentsEntity> pager = new Pager<>();
		//设置当前页
		pager.setPageNow(Integer.parseInt(pageNow));
		//设置总数量
		pager.setTotalCount(commentsDao.selectTotalCount());
		//设置页面数量
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		//分页操作
		pager = commentsDao.selectComments(pager);
		//将分页数据传入请求作用域
		session.setAttribute("pager", pager);
		request.getRequestDispatcher("/WEB-INF/adminjsp/comments.jsp").forward(request, response);
	}
	
	/**
	 * 删除评论
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	 protected void deleteComments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String cid = request.getParameter("cid");
		  //删除评论
		  commentsDao.deleteComments(Integer.parseInt(cid));
		  response.sendRedirect(request.getContextPath()+"/admin/comments");
	  }
	 
	 /**
	  * 查询职位
	  * @param request
	  * @param response
	  * @throws ServletException
	  * @throws IOException
	  */
	private void job(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String pageNow = request.getParameter("pageNow");
		if(!StringUtils.isNotNull(pageNow)) {
			pageNow = "1";
		}
		//初始化分页对象
		Pager<JobEntity> pager = new Pager<>();
		//设置当前页
		pager.setPageNow(Integer.parseInt(pageNow));
		//设置总数量
		pager.setTotalCount(jobDao.selectTotalCount());
		//设置页面数量
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		//分页操作
		pager = jobDao.selectJob(pager);
		//将分页数据传入请求作用域
		session.setAttribute("pager", pager);
		request.getRequestDispatcher("/WEB-INF/adminjsp/jobs.jsp").forward(request, response);
	}
	
	/**
	 * 删除职位
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void deleteJob(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 String jid = request.getParameter("jid");
		  //删除
		  jobDao.deleteJob(Integer.parseInt(jid));
		  response.sendRedirect(request.getContextPath()+"/admin/job");
	}
	
	/**
	 * 用户查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String pageNow = request.getParameter("pageNow");
		if(!StringUtils.isNotNull(pageNow)) {
			pageNow = "1";
		}
		//初始化分页对象
		Pager<UserEntity> pager = new Pager<>();
		//设置当前页
		pager.setPageNow(Integer.parseInt(pageNow));
		//设置总数量
		pager.setTotalCount(userDao.selectTotalCount());
		//设置页面数量
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		//分页操作
		pager = userDao.selectUser(pager);
		//将分页数据传入请求作用域
		session.setAttribute("pager", pager);
		request.getRequestDispatcher("/WEB-INF/adminjsp/user.jsp").forward(request, response);
	}
	
	/**
	 * 删除用户
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 String uid = request.getParameter("uid");
		  //删除用户
		  userDao.deleteUser(Integer.parseInt(uid));
		  response.sendRedirect(request.getContextPath()+"/admin/user");
	}
	
	/**
	 * 修改用户信息
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String uid = request.getParameter("uid");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String photo = request.getParameter("photo");
		//创建并初始化用户对象
		UserEntity user = new UserEntity();
		user.setUid(Integer.parseInt(uid));
		user.setUsername(username);
		user.setPassword(password);
		user.setPhoto(photo);
		//将更新之后的用户传入请求作用域
		request.setAttribute("NOW_USER", user);
		request.getRequestDispatcher("/WEB-INF/adminjsp/updateUser.jsp").forward(request, response);
	}
	
	/**
	 * 简历查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void resume(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String pageNow = request.getParameter("pageNow");
		if(!StringUtils.isNotNull(pageNow)) {
			pageNow = "1";
		}
		//初始化分页对象
		Pager<ResumeEntity> pager = new Pager<>();
		//设置当前页
		pager.setPageNow(Integer.parseInt(pageNow));
		//设置总数量
		pager.setTotalCount(resumeDao.selectTotalCount());
		//设置页面数量
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		//分页操作
		pager = resumeDao.selectResume(pager);
		//将分页数据传入请求作用域
		session.setAttribute("pager", pager);
		request.getRequestDispatcher("/WEB-INF/adminjsp/resumes.jsp").forward(request, response);
	}
	
	/**
	 * 删除简历
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void deleteResume(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 String rid = request.getParameter("rid");
		  //删除简历
		  resumeDao.deleteResume(Integer.parseInt(rid));
		  response.sendRedirect(request.getContextPath()+"/admin/resume");
	}
	
	/**
	 * 登陆
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/adminjsp/login.jsp").forward(request, response);
	}
	
	/**
	 * 执行登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void loginDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username =request.getParameter("username");
		String password =request.getParameter("password");
		//内置用户名密码并判断
		if("admin".equals(username) && "admin".equals(password)) {
			request.getSession().setAttribute("CUR_USER", 1);
			response.sendRedirect(request.getContextPath()+"/admin/main");
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/login");
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
