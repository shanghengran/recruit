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

import com.recruit.dao.JobDao;
import com.recruit.dao.ResumeDao;
import com.recruit.entity.JobEntity;
import com.recruit.entity.ResumeEntity;
import com.recruit.entity.UserEntity;
import com.recruit.util.StringUtils;

/**
 * Servlet implementation class ResumeController
 */
@WebServlet("/resume/*")
public class ResumeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ResumeDao resumeDao = new ResumeDao();
	private JobDao jobDao = new JobDao();
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取协议、主机名、端口号之后的路径 URL=协议+主机名+端口号+URI
		String uri = request.getRequestURI();
		//将URI路径除了操作之前的路径替换为空
		uri = uri.substring((request.getContextPath()+"/resume/").length());
		if("addResume".equals(uri)) {
			addResume(request,response);
		}else if("addResumeDo".equals(uri)) {
			addResumeDo(request,response);
		}else if("myResume".equals(uri)) {
			myResume(request,response);
		}else if("updateResume".equals(uri)) {
			updateResume(request,response);
		}else if("updateResumeDo".equals(uri)) {
			updateResumeDo(request,response);
		}else if("applyJob".equals(uri)) {
			applyJob(request,response);
		}else if("viewJob".equals(uri)) {
			viewJob(request,response);
		}
		
	}

	/**
	 * 浏览工作
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException
	 */
	private void viewJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jid = request.getParameter("jid");
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity) session.getAttribute("CUR_USER");
		boolean isApply = false;
		if(user != null) {
			ResumeEntity resume = (ResumeEntity) session.getAttribute("resume");
			if(resume != null) {
				isApply = jobDao.isApply(resume.getRid(), Integer.parseInt(jid));
			}
		}
		session.setAttribute("isApply", isApply);
		JobEntity job = jobDao.selectJobByJidToFirm(Integer.parseInt(jid));
		session.setAttribute("NOWJOB", job);
		request.getRequestDispatcher("/WEB-INF/jsp/viewJob.jsp").forward(request,response);
	}

	/**
	 * 申请工作
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException 
	 */
	private void applyJob(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String nowjid = request.getParameter("jid");
		ResumeEntity resume = (ResumeEntity) session.getAttribute("resume");
		if(resume == null) {
			response.sendRedirect(request.getContextPath()+"/resume/addResume");
			return;
		}
		jobDao.applyJob(resume.getRid(),Integer.parseInt(nowjid));
		boolean isApply = jobDao.isApply(resume.getRid(), Integer.parseInt(nowjid));
		session.setAttribute("isApply", isApply);
		JobEntity job = jobDao.selectJobByJidToFirm(Integer.parseInt(nowjid));
		session.setAttribute("job", job);
		response.sendRedirect(request.getContextPath()+"/resume/viewJob?jid="+Integer.parseInt(nowjid));
	}
	

	/**
	 * 查看简历
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void myResume(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取session
		HttpSession session = request.getSession();
		ResumeEntity resume = (ResumeEntity) session.getAttribute("resume");
		//判断简历是否为空
		if(resume != null) {
			//有简历，查看简历
			request.getRequestDispatcher("/WEB-INF/jsp/myResume.jsp").forward(request, response);
		}else {
			//没简历，跳转到添加简历页面
			response.sendRedirect(request.getContextPath()+"/resume/addResume");
		}
	}

	/**
	 * 添加简历
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void addResumeDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = getServletContext().getRealPath("/files");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//UUID 128位
		String fileName = null;
		
		String realName = null;
		String age = null;
		String gender = null;
		String phone = null;
		String education = null;
		String experience = null;
		String intention = null;
		String salary = null;
		String introduction = null;
		try {
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> items = upload.parseRequest(request);
		//遍历数据
		for(int i=0;i<items.size();i++){
			FileItem item = items.get(i);
			if (item.isFormField()) { // 表单数据
			       String fieldName = item.getFieldName();
			       if (fieldName.equals("realName")){
			    	   realName = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("age")) {
			    	   age = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("gender")) {
			    	   gender = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("phone")) {
			    	   phone = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("education")) {
			    	   education = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("experience")) {
			    	   experience = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("intention")) {
			    	   intention = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("salary")) {
			    	   salary = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("introduction")) {
			    	   introduction = StringUtils.toUTF8(item.getString());
			       }
			}
			 else{ // 文件数据
					 String name = item.getName();
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
			}
		}catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		//创建resume
		ResumeEntity resume = new ResumeEntity();
		//给resume赋值
		resume.setRealName(realName);
		resume.setGender(gender);
		resume.setAge(Integer.parseInt(age));
		resume.setPhone(phone);
		resume.setEducation(education);
		resume.setExperience(experience);
		resume.setIntention(intention);
		resume.setSalary(Double.parseDouble(salary));
		resume.setIntroduction(introduction);
		if(!StringUtils.isNotNull(fileName)) {
			fileName = "";
		}
		resume.setrFile(fileName);
		
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity) session.getAttribute("CUR_USER");
		//判断是否添加简历成功
		if(resumeDao.insertResumeByLogin(resume,user.getUid())) {
			ResumeEntity resumeEntity = resumeDao.selectResumeByUid(user.getUid());
			//添加成功，并存在session中，最后返回主页
			session.setAttribute("resume", resumeEntity);
			response.sendRedirect(request.getContextPath()+"/user/userIndex");
		}else {
			//添加失败，返回添加页面
			response.sendRedirect(request.getContextPath()+"/resume/addResume");
		}
	}
	
	/**
	 * 转发到添加简历页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addResume(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/addResume.jsp").forward(request, response);
	}
	/**
	 * 更新简历
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void updateResume(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/updateResume.jsp").forward(request,response);
	}
	/**
	 * 更新简历操作
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void updateResumeDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//确定上传来的文件放在哪里？ photo文件夹里面
		String path = getServletContext().getRealPath("/files");
		File dir = new File(path);
		//如果没有就创建
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//定义并初始化参数
		String realName = null;
		String gender = null;
		String age = null;
		String phone = null;
		String education = null;
		String experience = null;
		String intention = null;
		String salary = null;
		String introduction = null;
		String rFile = null;

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
					if(fieldName.equals("realName")) {
						//涉及文件上传时  普通表单元素会乱码  使用get方式来处理
						realName = StringUtils.toUTF8(item.getString());
					}else if (fieldName.equals("gender")){
						//涉及文件上传时  普通表单元素会乱码  使用get方式来处理
						gender = StringUtils.toUTF8(item.getString());
					}else if (fieldName.equals("age")){
						//涉及文件上传时  普通表单元素会乱码  使用get方式来处理
						age = StringUtils.toUTF8(item.getString());
					}else if (fieldName.equals("phone")){
						//涉及文件上传时  普通表单元素会乱码  使用get方式来处理
						phone = StringUtils.toUTF8(item.getString());
					}else if (fieldName.equals("education")){
						//涉及文件上传时  普通表单元素会乱码  使用get方式来处理
						education = StringUtils.toUTF8(item.getString());
					}else if (fieldName.equals("experience")){
						//涉及文件上传时  普通表单元素会乱码  使用get方式来处理
						experience = StringUtils.toUTF8(item.getString());
					}else if (fieldName.equals("intention")){
						//涉及文件上传时  普通表单元素会乱码  使用get方式来处理
						intention = StringUtils.toUTF8(item.getString());
					}else if (fieldName.equals("salary")){
						//涉及文件上传时  普通表单元素会乱码  使用get方式来处理
						salary = StringUtils.toUTF8(item.getString());
					}else if (fieldName.equals("introduction")){
						//涉及文件上传时  普通表单元素会乱码  使用get方式来处理
						introduction = StringUtils.toUTF8(item.getString());
					}
				}else{ // 如果是文件数据
					//=====不能动开始
					//文件的真实名字
					String name = item.getName();
					if(StringUtils.isNotNull(name)) {
						//UUID 128位  将文件真实名称改为UUID名称
						rFile = UUID.randomUUID().toString();
						String suff = name.substring(name.lastIndexOf("."));
						rFile += suff;
						OutputStream fos = new FileOutputStream(new File(path,rFile));
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
		//获取当前登录用户
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity) session.getAttribute("CUR_USER");
		//获取当前用户简历
		ResumeEntity resume = (ResumeEntity) session.getAttribute("resume");
		//创建用户对象并赋值
		ResumeEntity resumeEntity = new ResumeEntity();
		resumeEntity.setRealName(realName);
		resumeEntity.setGender(gender);
		resumeEntity.setAge(Integer.parseInt(age));
		resumeEntity.setPhone(phone);
		resumeEntity.setEducation(education);
		resumeEntity.setExperience(experience);
		resumeEntity.setIntention(intention);
		resumeEntity.setSalary(Double.parseDouble(salary));
		if (!StringUtils.isNotNull(rFile)) {
			rFile = resume.getrFile();
		}
		resumeEntity.setrFile(rFile);
		//进行修改操作
		if(resumeDao.updateResume(resumeEntity,user.getUid())) {
			resume = resumeDao.selectResumeByUid(user.getUid());
			//将新的当前用户信息传入session
			request.getSession().setAttribute("resume", resume);
			//重定向 跳转到个人中心
			response.sendRedirect(request.getContextPath()+"/resume/myResume");
		}else{
			//重定向 继续修改
			response.sendRedirect(request.getContextPath()+"/resume/updateResume");
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
