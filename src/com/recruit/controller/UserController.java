package com.recruit.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.recruit.dao.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.recruit.entity.Result;
import com.google.gson.Gson;
import com.recruit.entity.AssociationEntity;
import com.recruit.entity.CommentsEntity;
import com.recruit.entity.FirmEntity;
import com.recruit.entity.JobEntity;
import com.recruit.entity.Pager;
import com.recruit.entity.ResumeEntity;
import com.recruit.entity.UserEntity;
import com.recruit.util.StringUtils;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
	private ResumeDao resumeDao = new ResumeDao();
	private JobDao jobDao = new JobDao();
	private AssociationDao associationDao = new AssociationDao();
	private FirmDao firmDao = new FirmDao();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取协议、主机名、端口号之后的路径 URL=协议+主机名+端口号+URI
		String uri = request.getRequestURI();
		//将URI路径除了操作之前的路径替换为空
		uri = uri.replaceAll(request.getContextPath()+"/user/", "");
		if("reg".equals(uri)) {
			reg(request,response);
		}else if("regDo".equals(uri)) {
			regDo(request,response);
		}else if("val".equals(uri)) {
			val(request,response);
		}else if("login".equals(uri)) {
			login(request,response);
		}else if("loginDo".equals(uri)) {
			loginDo(request,response);
		}else if("userIndex".equals(uri)) {
			userIndex(request,response);
		}else if("update_photo".equals(uri)) {
			update_photo(request,response);
		}else if("update_password".equals(uri)) {
			update_password(request,response);
		}else if("personalCenter".equals(uri)) {
			personalCenter(request,response);
		}else if("quitPerUser".equals(uri)) {
			quitPerUser(request,response);
		}else if("quitComUser".equals(uri)){
			quitComUser(request,response);
		}else if("viewFirm".equals(uri)) {
			viewFirm(request,response);
		}else if("sendInfoBack".equals(uri)) {
			sendInfoBack(request,response);
		}else if("addComment".equals(uri)) {
			addComment(request,response);
		}else if("checkUsername".equals(uri)) {
			checkUsername(request,response);
		}else if("checkVal".equals(uri)) {
			checkVal(request,response);
		}else if("searchJobs".equals(uri)) {
			searchJobs(request,response);
		}else if("checkPassword".equals(uri)) {
			checkPassword(request,response);
		}else if("backIndex".equals(uri)) {
			backIndex(request,response);
		}else {
			response.sendRedirect(request.getContextPath()+"/user/userIndex");
		}
	}
	/**
	 * 关于我们回到主页
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void backIndex(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();	
		UserEntity user = (UserEntity) session.getAttribute("CUR_USER"); 
		if (user != null) {
			if("company".equals(user.getType())) {
				
				response.sendRedirect(request.getContextPath()+"/firm/firmIndex");
			}else {
				//查询简历
				ResumeEntity resume = resumeDao.selectResumeByUid(user.getUid());
				//判断是否有简历
				if(resume != null) {
					//有则先将查询的简历存入session中
					session.setAttribute("resume", resume);
				}
				//没有则直接前往主页
				response.sendRedirect(request.getContextPath()+"/user/userIndex");
			}
		} else {
			//没有则直接前往主页
			response.sendRedirect(request.getContextPath()+"/user/userIndex");
		}
		
	}

	/**
	 * 查询工作
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void searchJobs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String jobName = request.getParameter("jobName");
		if(jobName == null) {
			response.sendRedirect(request.getContextPath()+"/user/userIndex");
			return;
		}
		List<JobEntity> jobs = userDao.selectJobsByJobName(jobName);
		session.setAttribute("SEARCH", jobs);
		request.getRequestDispatcher("/WEB-INF/jsp/searchJobs.jsp").forward(request, response);
	}

	/**
	 * 查询原密码是否正确
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void checkPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		String username = request.getParameter("username");
		String oldPassword = request.getParameter("oldPassword");
		//服务器响应内容回去
		PrintWriter out = response.getWriter();
		Result<String> result = new Result<>();
		if(userDao.selectUserByPassword(username, oldPassword)) {
			result.setState(1);
			result.setMsg("√原密码输入正确！");
		}else {
			result.setState(0);
			result.setMsg("×原密码输入错误！");
		}
		Gson gson = new Gson();
		//响应json数据
		out.write(gson.toJson(result));
	}
	
	/**
	 * 检查验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void checkVal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		String valNow = request.getParameter("valNow");
		String valOld = (String) request.getSession().getAttribute("VAL_CODE");
		//服务器响应内容回去
		PrintWriter out = response.getWriter();
		Result<String> result = new Result<>();
		if(valOld.equalsIgnoreCase(valNow)) {
			result.setState(0);
			result.setMsg("√验证码正确");
		}else {
			result.setState(1);
			result.setMsg("×验证码错误");
		}
		Gson gson = new Gson();
		//响应json数据
		out.write(gson.toJson(result));
	}
	
	/**
	 * 检查用户名是否存在
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void checkUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json;charset=utf-8");
		String username = request.getParameter("username");
		//服务器响应内容回去
		PrintWriter out = response.getWriter();
		Result<String> result = new Result<>();
		if(userDao.selectUserByUsername(username)) {
			result.setState(1);
			result.setMsg("×已存在该用户!");
		}else {
			result.setState(0);
			result.setMsg("√该用户名可用，但请确认是邮箱！");
		}
		Gson gson = new Gson();
		//响应json数据
		out.write(gson.toJson(result));
	}
	
	/**
	 * 退出公司账户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void quitComUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("CUR_USER");
		session.removeAttribute("CUR_FIRM");
		response.sendRedirect(request.getContextPath()+"/user/userIndex");
	}
	
	/**
	 * 添加评论
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void addComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String jid = request.getParameter("jid");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity) session.getAttribute("CUR_USER");
		FirmEntity firm = (FirmEntity) session.getAttribute("FIRM");
		CommentsEntity comment = new CommentsEntity();
		comment.setUid(user.getUid());
		comment.setFid(firm.getFid());
		comment.setContent(content);
		comment.setSendTime(StringUtils.getCurrentTime());
		comment.setUser(user);
		userDao.addCommentToFirm(comment);
		response.sendRedirect(request.getContextPath()+"/user/viewFirm?fid="+firm.getFid()+"&jid="+jid);
	}

	/**
	 * 投简历状态
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void sendInfoBack(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ResumeEntity resume = (ResumeEntity) session.getAttribute("resume");
		if (resume == null) {
			response.sendRedirect(request.getContextPath()+"/resume/addResume");
			return;
		} else {
			List<AssociationEntity> sendSuccess = associationDao.selectResumeOnAssociationByRid(resume.getRid());
			session.setAttribute("sendSuccess", sendSuccess);
			List<AssociationEntity> belooked = associationDao.selectResumeWhenViewOnAssociationByRid(resume.getRid());
			session.setAttribute("belooked", belooked);
			List<AssociationEntity> interest = associationDao.selectResumeWhenInterestOnAssociationByRid(resume.getRid());
			session.setAttribute("interest", interest);
			List<AssociationEntity> interviewBefore = associationDao.selectResumeWhenInterviewBeforeOnAssociationByRid(resume.getRid());
			session.setAttribute("interviewBefore", interviewBefore);
			List<AssociationEntity> interviewAfter = associationDao.selectResumeWhenInterviewAfterOnAssociationByRid(resume.getRid());
			session.setAttribute("interviewAfter", interviewAfter);
		}
		request.getRequestDispatcher("/WEB-INF/jsp/resumeSendInfo.jsp").forward(request, response);
	}
	
	/**
	 * 查看公司信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void viewFirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Pager<CommentsEntity> pager = new Pager<>();
		String fid = request.getParameter("fid");
		String jid = request.getParameter("jid");
		session.setAttribute("CUR_JID", jid);
		FirmEntity firm = userDao.selectFirmByFidForLook(Integer.parseInt(fid));
		session.setAttribute("FIRM", firm);
		ResumeEntity resume = (ResumeEntity) session.getAttribute("resume");
		if(resume == null) {
			session.removeAttribute("association");
		}
		if(resume != null) {
			AssociationEntity association = (AssociationEntity) associationDao.selectStatusInterviewAfterOnAssociationByRidAndJid(resume.getRid(),Integer.parseInt(jid) );
			session.setAttribute("association", association);;
		}
		String pageNow = request.getParameter("pageNow");
		if(!StringUtils.isNotNull(pageNow)) {
			pageNow = "1";
		}
		pager.setPageNow(Integer.parseInt(pageNow));
		pager.setTotalCount(userDao.selectCountComment(Integer.parseInt(fid)));
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		pager = userDao.selectAllUsersCommentsToFirmByFid(Integer.parseInt(fid), pager);
		session.setAttribute("pager", pager);
		request.getRequestDispatcher("/WEB-INF/jsp/viewFirm.jsp").forward(request, response);
	}

	/**
	 * 退出用户
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void quitPerUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//获取当前用户
		HttpSession session = request.getSession();
		//删除session
		session.removeAttribute("CUR_USER");
		session.removeAttribute("resume");
		response.sendRedirect(request.getContextPath()+"/user/userIndex");
	}

	/**
	 * 个人中心
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void personalCenter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/personalCenter.jsp").forward(request, response);
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void update_password(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//获取当前user
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity) session.getAttribute("CUR_USER");
		//获取数据
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		//判断是否修改成功
		userDao.update_password(user,oldPassword ,newPassword);
		response.sendRedirect(request.getContextPath()+"/user/personalCenter");
	}
	
	/**
	 * 修改图片
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void update_photo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity) session.getAttribute("CUR_USER");
		//获取文件路径
		String path = getServletContext().getRealPath("/photo");
		//新建文件
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//UUID 128位 
		String fileName = null;
		try {
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> items = upload.parseRequest(request);
		//遍历参数
		for(int i=0;i<items.size();i++){
			 FileItem item = items.get(i);
			 String name = item.getName();//文件数据
			 if(StringUtils.isNotNull(name)) {
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
				 in.close(); 
				 fos.close();
			 }
		   }
		}catch (FileUploadException e) {
			e.printStackTrace();
		}
		UserEntity u = new UserEntity();
		u.setUid(user.getUid());
		u.setUsername(user.getUsername());
		u.setPassword(user.getPassword());
		u.setType(user.getType());
		if(!StringUtils.isNotNull(fileName)) {
			fileName = user.getPhoto();
		}
		u.setPhoto(fileName);
		if(userDao.update_photo(u)) {
			session.setAttribute("CUR_USER", u);
		}
		response.sendRedirect(request.getContextPath()+"/user/personalCenter");
	}

	/**
	 * 到用户主页
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void userIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取当前浏览器session
		HttpSession session = request.getSession();
		//新建一个职位类型的分页实体
		Pager<JobEntity> pager = new Pager<>();
		//获取当前页数
		String pageNow = request.getParameter("pageNow");
		//如果当前页数为空，就赋值为1
		if(!StringUtils.isNotNull(pageNow)) {
			pageNow = "1";
		}
		//设置每页显示数量
		pager.setPageSize(3);
		//设置当前页
		pager.setPageNow(Integer.parseInt(pageNow));
		//设置职位总条数
		pager.setTotalCount(jobDao.selectTotalCount());
		//设置计算出的总页数
		pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
		//进入职位的数据操作类，进行数据操作
		pager = jobDao.selectJobs(pager);
		//将这个职位类型的分页实体传入到session作用域属性名为AllJOBS中
		session.setAttribute("ALLJOBS", pager);
		//获取职位总数
		int jobCount = jobDao.selectTotalCount();
		//获取简历总数
		int resumeCount = resumeDao.selectTotalCount();
		//获取用户总数
		int userCount = userDao.selectTotalCount();
		//获取企业总数
		int firmCount = firmDao.selectTotalCount();
		//将这个职位总数传入到session作用域属性名为count_job中
		session.setAttribute("count_job",jobCount);
		//将这个简历总数传入到session作用域属性名为count_resume中
		session.setAttribute("count_resume",resumeCount);
		//将这个用户总数传入到session作用域属性名为count_user中
		session.setAttribute("count_user",userCount);
		//将这个企业总数传入到session作用域属性名为count_firm中
		session.setAttribute("count_firm",firmCount);
		//转发到userIndex.jsp页面
		request.getRequestDispatcher("/WEB-INF/jsp/userIndex.jsp").forward(request, response);
	}


	/**
	 * 执行登陆
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void loginDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 //获取数据
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("user_type");
		String valNow = request.getParameter("val");
		String valOld = (String) request.getSession().getAttribute("VAL_CODE");
		//判断是否为空
		if(!StringUtils.isNotNull(username) || !StringUtils.isNotNull(password) || !StringUtils.isNotNull(type)) {
			response.sendRedirect(request.getContextPath()+"/user/login");
			return;
		}
		if(!valOld.equalsIgnoreCase(valNow)) {
			response.sendRedirect(request.getContextPath()+"/user/login");
			return;
		}
		//创建用户
		UserEntity user = new UserEntity();
		//给用户赋值
		user.setUsername(username);
		user.setPassword(password);
		user.setType(type);
		//插入数据库
		user = userDao.selectUserByLogin(user);
		//判断是否有用户
		if(user != null){
			//有用户，则存入session中
			HttpSession session = request.getSession();
			session.setAttribute("CUR_USER", user);
			if("company".equals(user.getType())) {
				
				response.sendRedirect(request.getContextPath()+"/firm/firmIndex");
			}else {
				//查询简历
				ResumeEntity resume = resumeDao.selectResumeByUid(user.getUid());
				//判断是否有简历
				if(resume != null) {
					//有则先将查询的简历存入session中
					session.setAttribute("resume", resume);
				}
				//没有则直接前往主页
				response.sendRedirect(request.getContextPath()+"/user/userIndex");
			}
		}else {
			//没有用户，继续留在登录页面
			response.sendRedirect(request.getContextPath()+"/user/login");
		}
	}
	
	/**
	 * 登录
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
	}
	
	/**
	 * 执行注册
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void regDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//获取数据
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("userType");
		//判断是否为空
		if(!StringUtils.isNotNull(username) || !StringUtils.isNotNull(password) || !StringUtils.isNotNull(type)) {
			response.sendRedirect(request.getContextPath()+"/user/reg");
			return;
		}
		//创建user
		UserEntity user = new UserEntity();
		//给user赋值
		user.setUsername(username);
		user.setPassword(password);
		user.setType(type);
		//判断是否注册用户成功
		if(userDao.addUser(user)){
			//注册成功，去登录页面
			response.sendRedirect(request.getContextPath()+"/user/login");
		}else {
			//注册失败，返回注册页面
			response.sendRedirect(request.getContextPath()+"/user/reg");
		}
	}
	
	/**
	 * 注册
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void reg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/reg.jsp").forward(request, response);;
	}

	/**
	 * 产生验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void val(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//响应方式
		response.setContentType("image/jepg");
		//创建背景
		BufferedImage image = new BufferedImage(80, 18, BufferedImage.TYPE_INT_RGB);
		//创建画笔
		Graphics2D g = image.createGraphics();
		//随机产生颜色
		int r1 = (int) (Math.random()*127);
		int b1 = (int) (Math.random()*127);
		int g1 = (int) (Math.random()*127);
		Color color = new Color(r1, g1, b1);
		g.setColor(color);
		//填充背景
		g.fillRect(0, 0, 80, 18);
		//将随机产生的数字放到背景中
		String str = randomString();
		System.out.println("VAL_CODE:" + str);
		for (int i = 0; i < str.length(); i++) {
			int r2 = (int) (Math.random()*127+127);
			int g2 = (int) (Math.random()*127+127);
			int b2 = (int) (Math.random()*127+127);
			Color color2 = new Color(r2, g2, b2);
			g.setColor(color2);
			//创建session
			HttpSession session = request.getSession();
			//存放到session中
			session.setAttribute("VAL_CODE", str);
			g.drawString(str.charAt(i)+"", 20*i+5, 18);
		}
		//随机生成线条
		for (int i = 0; i < 1; i++) {
			int r2 = (int) (Math.random()*127);
			int g2 = (int) (Math.random()*127);
			int b2 = (int) (Math.random()*127);
			Color color2 = new Color(r2, g2, b2);
			g.setColor(color2);
			int x1 = (int) (Math.random()*80);
			int y1 = (int) (Math.random()*20);
			int x2 = (int) (Math.random()*80);
			int y2 = (int) (Math.random()*20);
			g.drawLine(x1, y1, x2, y2);
		}
		//随机产生雪花
		for (int i = 0; i < 2; i++) {
			g.setColor(Color.WHITE);
			int x1 = (int) (Math.random()*80);
			int y1 = (int) (Math.random()*20);
			g.drawString("*", x1, y1);
		}
		//响应
		ImageIO.write(image, "jpg", response.getOutputStream());
	}
	
	/**
	 * 4位随机字符
	 */
	String str = "abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789";
	private String randomString() {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 4; i++) {
			int a = (int) (Math.random()*str.length());
			sb.append(str.charAt(a));
		}
		return sb.toString();
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
