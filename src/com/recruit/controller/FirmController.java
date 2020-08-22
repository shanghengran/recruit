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

import com.recruit.dao.FirmDao;
import com.recruit.dao.JobDao;
import com.recruit.dao.ResumeDao;
import com.recruit.entity.FirmEntity;
import com.recruit.entity.JobEntity;
import com.recruit.entity.Pager;
import com.recruit.entity.ResumeEntity;
import com.recruit.entity.UserEntity;
import com.recruit.util.StringUtils;

/**
 * Servlet implementation class FirmController
 */
@WebServlet("/firm/*")
public class FirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private FirmDao firmDao = new FirmDao();  
    private JobDao jobDao = new JobDao();
    private ResumeDao resumeDao = new ResumeDao();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取协议、主机名、端口号之后的路径 URL=协议+主机名+端口号+URI
		String uri = request.getRequestURI();
		//将URI路径除了操作之前的路径替换为空
		uri = uri.replaceAll(request.getContextPath()+"/firm/", "");
		if("myCenter".equals(uri)) {
			myCenter(request,response);
		}else if ("myFirm".equals(uri)) {
			myFirm(request,response);
		}else if ("insertMyFirm".equals(uri)) {
			insertMyFirm(request,response);
		}else if ("updateMyFirm".equals(uri)) {
			updateMyFirm(request,response);
		}else if ("resumesList".equals(uri)) {
			resumesList(request,response);
		}else if ("jobsList".equals(uri)) {
			jobsList(request,response);
		}else if ("firmIndex".equals(uri)) {
			firmIndex(request,response);
		}
	}

	/**
	 * 主页跳转
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void firmIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity)session.getAttribute("CUR_USER");
		int receiveResumes = 0;
		int postJobs = 0;
		if (user != null) {
			FirmEntity firm = firmDao.selectFirmByUid(user.getUid());
			if(firm == null) {
				request.getRequestDispatcher("/WEB-INF/jsp/createFirm.jsp").forward(request, response);
				return;
			}
			session.setAttribute("CUR_FIRM", firm);
			receiveResumes = resumeDao.selectTotalCountByFid(firm.getFid());
			postJobs = jobDao.selectTotalCountByFid(firm.getFid());
			session.setAttribute("RECEIVE_RESUMES",receiveResumes);
			session.setAttribute("POST_JOBS",postJobs);
		}
		request.getRequestDispatcher("/WEB-INF/jsp/firmIndex.jsp").forward(request,response);
	}

	/**
	 * 申请建立列表跳转
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void resumesList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserEntity user = (UserEntity)session.getAttribute("CUR_USER");
        if (user != null) {
            FirmEntity firm = firmDao.selectFirmByUid(user.getUid());
            if(firm == null) {
                request.getRequestDispatcher("/WEB-INF/jsp/createFirm.jsp").forward(request, response);
                return;
            }
            session.setAttribute("CUR_FIRM", firm);
            //本公司接收到的简历分页显示
            Pager<ResumeEntity> pager = new Pager<>();
            String pageNow = request.getParameter("pageNow");
            if(!StringUtils.isNotNull(pageNow)) {
                pageNow = "1";
            }
            pager.setPageSize(3);
            pager.setPageNow(Integer.parseInt(pageNow));
            pager.setTotalCount(resumeDao.selectTotalCountByFid(firm.getFid()));
            pager.setPageCount((pager.getTotalCount()-1)/pager.getPageSize()+1);
            pager = resumeDao.selectResumesOnFirm(pager, firm.getFid());
            //将简历分页数据传入请求作用域
            session.setAttribute("FIRM_RESUMES", pager);
        }
        request.getRequestDispatcher("/WEB-INF/jsp/resumesList.jsp").forward(request, response);
	}


	/**
	 * 发布工作列表跳转
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void jobsList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity)session.getAttribute("CUR_USER");
		if (user != null) {
			FirmEntity firm = firmDao.selectFirmByUid(user.getUid());
			if (firm == null) {
				request.getRequestDispatcher("/WEB-INF/jsp/createFirm.jsp").forward(request, response);
				return;
			}
			session.setAttribute("CUR_FIRM", firm);
			//本公司发布的职位分页显示
			Pager<JobEntity> pager1 = new Pager<>();
			String pageNow = request.getParameter("pageNow");
			if(!StringUtils.isNotNull(pageNow)) {
				pageNow = "1";
			}
			pager1.setPageSize(3);
			pager1.setPageNow(Integer.parseInt(pageNow));
			pager1.setTotalCount(jobDao.selectTotalCountByFid(firm.getFid()));
			pager1.setPageCount((pager1.getTotalCount()-1)/pager1.getPageSize()+1);
			pager1 = jobDao.selectJobsByFid(pager1, firm.getFid());
			//将职位分页数据传入请求作用域
			request.setAttribute("JOBS", pager1);
		}
		request.getRequestDispatcher("/WEB-INF/jsp/jobsList.jsp").forward(request, response);
	}

	/**
	 * 更新公司信息操作
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void updateMyFirm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//确定上传来的文件放在哪里？ photo文件夹里面
		String path = getServletContext().getRealPath("/files");
		File dir = new File(path);
		//如果没有就创建
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//定义并初始化参数
		String[] fileNames = new String[2];
		String uid = null;
		String fid = null;
		String firmName = null;
		String place = null;
		String tel = null;
		String manager = null;
		String profile = null;
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
				       }else if (fieldName.equals("fid")){
				    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
				    	   fid = StringUtils.toUTF8(item.getString());
				       }else if (fieldName.equals("firmName")){
				    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
				    	   firmName = StringUtils.toUTF8(item.getString());
				       }else if (fieldName.equals("place")){
				    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
				    	   place = StringUtils.toUTF8(item.getString());
				       }else if (fieldName.equals("tel")){
				    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
				    	   tel = StringUtils.toUTF8(item.getString());
				       }else if (fieldName.equals("manager")){
				    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
				    	   manager = StringUtils.toUTF8(item.getString());
				       }else if (fieldName.equals("profile")){
				    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
				    	   profile = StringUtils.toUTF8(item.getString());
				       }
				 }else{ // 如果是文件数据
					 String fieldName = item.getFieldName();
					 if (fieldName.equals("logo")){
						 //=====不能动开始
						//文件的真实名字
						 String name = item.getName();
						 if(StringUtils.isNotNull(name)) {
							 //UUID 128位  将文件真实名称改为UUID名称
							 fileNames[0] = UUID.randomUUID().toString();
							 String suff = name.substring(name.lastIndexOf("."));
							 fileNames[0] += suff;
							 OutputStream fos = new FileOutputStream(new File(path,fileNames[0]));  
							 InputStream in = item.getInputStream();   
							 byte[] buffer = new byte[1024];
							 int len = -1;      
							 while ((len = in.read(buffer)) != -1) { 
							     fos.write(buffer,0,len);
							 }      
							 in.close(); fos.close();
						 }
						 //====不能动结束
					 }else if (fieldName.equals("fFile")) {
						 //=====不能动开始
							//文件的真实名字
							 String name = item.getName();
							 if(StringUtils.isNotNull(name)) {
								 //UUID 128位  将文件真实名称改为UUID名称
								 fileNames[1] = UUID.randomUUID().toString();
								 String suff = name.substring(name.lastIndexOf("."));
								 fileNames[1] += suff;
								 OutputStream fos = new FileOutputStream(new File(path,fileNames[1]));  
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
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		FirmEntity firm = (FirmEntity)session.getAttribute("CUR_FIRM");
		//创建用户对象并赋值
		FirmEntity firmEntity = new FirmEntity();
		firmEntity.setFid(Integer.parseInt(fid));
		firmEntity.setLogo(fileNames[0]);
		firmEntity.setFirmName(firmName);
		firmEntity.setPlace(place);
		firmEntity.setTel(tel);
		firmEntity.setManager(manager);
		firmEntity.setProfile(profile);
		firmEntity.setfFile(fileNames[1]);
		if (!StringUtils.isNotNull(fileNames[0])) {
			firmEntity.setLogo(firm.getLogo());
		}
		if (!StringUtils.isNotNull(fileNames[1])) {
			firmEntity.setfFile(firm.getfFile());
		}
		//进行修改操作
		if(firmDao.upadteFirm(firmEntity)) {
			firm = firmDao.selectFirmByUid(Integer.parseInt(uid));
			//将新的当前用户信息传入session
			request.getSession().setAttribute("CUR_FIRM", firm);
			//重定向 跳转到个人中心
			response.sendRedirect(request.getContextPath()+"/firm/firmIndex");
		}else{
			//重定向 继续修改
			response.sendRedirect(request.getContextPath()+"/firm/myFirm");
		}
	}
	
	/**
	 * 创建新公司
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void insertMyFirm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//确定上传来的文件放在哪里？ photo文件夹里面
		String path = getServletContext().getRealPath("/files");
		File dir = new File(path);
		//如果没有就创建
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//定义并初始化参数
		String fileName = null;
		String uid = null;
		String firmName = null;
		String place = null;
		String tel = null;
		String manager = null;
		String profile = null;
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
			       }else if (fieldName.equals("firmName")){
			    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
			    	   firmName = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("place")){
			    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
			    	   place = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("tel")){
			    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
			    	   tel = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("manager")){
			    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
			    	   manager = StringUtils.toUTF8(item.getString());
			       }else if (fieldName.equals("profile")){
			    	   //涉及文件上传时  普通表单元素会乱码  使用get方式来处理
			    	   profile = StringUtils.toUTF8(item.getString());
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
		//创建用户对象并赋值
		FirmEntity firm = new FirmEntity();
		firm.setFirmName(firmName);
		firm.setPlace(place);
		firm.setTel(tel);
		firm.setManager(manager);
		firm.setProfile(profile);
		firm.setfFile(fileName);
		//进行修改操作
		if(firmDao.insertFirm(firm, Integer.parseInt(uid))) {
			firm = firmDao.selectFirmByUid(Integer.parseInt(uid));
			//将新的当前用户信息传入session
			request.getSession().setAttribute("CUR_FIRM", firm);
			//重定向 跳转到个人中心
			response.sendRedirect(request.getContextPath()+"/firm/firmIndex");
		}else{
			//重定向 继续修改
			response.sendRedirect(request.getContextPath()+"/firm/firmIndex");
		}
	}

	/**
	 * 公司信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void myFirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity)session.getAttribute("CUR_USER");
		FirmEntity firm = firmDao.selectFirmByUid(user.getUid());
		if (firm==null) {
			request.getRequestDispatcher("/WEB-INF/jsp/createFirm.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("CUR_FIRM", firm);
			request.getRequestDispatcher("/WEB-INF/jsp/updateFirm.jsp").forward(request, response);
		}
	}
	
	/**
	 * 个人中心页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void myCenter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取session中的当前用户
		UserEntity user = (UserEntity)request.getSession().getAttribute("CUR_USER");
		//请求作用域增加当前用户属性
		request.setAttribute("CUR_USER", user);
		request.getRequestDispatcher("/WEB-INF/jsp/center.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
