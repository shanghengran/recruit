package com.recruit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recruit.dao.AssociationDao;
import com.recruit.dao.JobDao;
import com.recruit.dao.ResumeDao;
import com.recruit.entity.AssociationEntity;
import com.recruit.entity.FirmEntity;
import com.recruit.entity.JobEntity;
import com.recruit.entity.ResumeEntity;

/**
 * Servlet implementation class JobController
 */
@WebServlet("/job/*")
public class JobController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private JobDao jobDao = new JobDao();
    private ResumeDao resumeDao = new ResumeDao();
    private AssociationDao associationDao = new AssociationDao();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取协议、主机名、端口号之后的路径 URL=协议+主机名+端口号+URI
		String uri = request.getRequestURI();
		//将URI路径除了操作之前的路径替换为空
		uri = uri.replaceAll(request.getContextPath()+"/job/", "");
		if ("createJob".equals(uri)) {
			createJob(request,response);
		}else if ("createJobDo".equals(uri)) {
			createJobDo(request,response);
		}else if ("updateJob".equals(uri)) {
			updateJob(request,response);
		}else if ("updateJobDo".equals(uri)) {
			updateJobDo(request,response);
		}else if ("deleteJob".equals(uri)) {
			deleteJob(request,response);
		}else if ("viewResume".equals(uri)) {
			viewResume(request,response);
		}else if ("isInterest".equals(uri)) {
			isInterest(request,response);
		}else if ("isInterviewBefore".equals(uri)) {
			isInterviewBefore(request,response);
		}else if ("isInterviewAfter".equals(uri)) {
			isInterviewAfter(request,response);
		}
	}
	
	/**
	 * 已面试操作
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void isInterviewAfter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rid = request.getParameter("rid");
		String jid = request.getParameter("jid");
		ResumeEntity resume = resumeDao.selectResumeByRid(Integer.parseInt(rid));
		request.setAttribute("resume", resume);
		request.setAttribute("JID", Integer.parseInt(jid));
		associationDao.updateStateOfInterviewAfter(Integer.parseInt(rid),Integer.parseInt(jid));
		AssociationEntity association = associationDao.selectState(Integer.parseInt(rid),Integer.parseInt(jid));
		request.setAttribute("STATE", association);
		request.getRequestDispatcher("/WEB-INF/jsp/viewResume.jsp").forward(request,response);
	}
	
	/**
	 * 可面试操作
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void isInterviewBefore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rid = request.getParameter("rid");
		String jid = request.getParameter("jid");
		ResumeEntity resume = resumeDao.selectResumeByRid(Integer.parseInt(rid));
		request.setAttribute("resume", resume);
		request.setAttribute("JID", Integer.parseInt(jid));
		associationDao.updateStateOfInterviewBefore(Integer.parseInt(rid),Integer.parseInt(jid));
		AssociationEntity association = associationDao.selectState(Integer.parseInt(rid),Integer.parseInt(jid));
		request.setAttribute("STATE", association);
		request.getRequestDispatcher("/WEB-INF/jsp/viewResume.jsp").forward(request,response);
	}
	
	/**
	 * 感兴趣操作
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void isInterest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rid = request.getParameter("rid");
		String jid = request.getParameter("jid");
		ResumeEntity resume = resumeDao.selectResumeByRid(Integer.parseInt(rid));
		request.setAttribute("resume", resume);
		request.setAttribute("JID", Integer.parseInt(jid));
		associationDao.updateStateOfInterest(Integer.parseInt(rid),Integer.parseInt(jid));
		AssociationEntity association = associationDao.selectState(Integer.parseInt(rid),Integer.parseInt(jid));
		request.setAttribute("STATE", association);
		request.getRequestDispatcher("/WEB-INF/jsp/viewResume.jsp").forward(request,response);
	}
	
	/**
	 * 查看简历
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void viewResume(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rid = request.getParameter("rid");
		String jid = request.getParameter("jid");
		ResumeEntity resume = resumeDao.selectResumeByRid(Integer.parseInt(rid));
		request.setAttribute("resume", resume);
		request.setAttribute("JID", Integer.parseInt(jid));
		associationDao.updateStateOfView(Integer.parseInt(rid),Integer.parseInt(jid));
		AssociationEntity association = associationDao.selectState(Integer.parseInt(rid),Integer.parseInt(jid));
		request.setAttribute("STATE", association);
		request.getRequestDispatcher("/WEB-INF/jsp/viewResume.jsp").forward(request,response);
	}
	
	/**
	 * 删除
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void deleteJob(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String jid = request.getParameter("jid");
		jobDao.deleteJobByJid(Integer.parseInt(jid));
		response.sendRedirect(request.getContextPath()+"/firm/jobsList");
	}
	
	/**
	 * 编辑职位操作
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void updateJobDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String jobName = request.getParameter("jobName");
		String pay = request.getParameter("pay");
		String reqExperience = request.getParameter("reqExperience");
		String reqEducation = request.getParameter("reqEducation");
		String attract = request.getParameter("attract");
		String description = request.getParameter("description");
		String jid = request.getParameter("jid");
		JobEntity job = new JobEntity();
		job.setJid(Integer.parseInt(jid));
		job.setJobName(jobName);
		job.setPay(Double.parseDouble(pay));
		job.setReqExperience(reqExperience);
		job.setReqEducation(reqEducation);
		job.setAttract(attract);
		job.setDescription(description);
		if (jobDao.updateJobByJid(job)) {
			response.sendRedirect(request.getContextPath()+"/firm/jobsList");
		} else {
			response.sendRedirect(request.getContextPath()+"/firm/jobsList");
		}
	}
	
	/**
	 * 编辑职位界面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void updateJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jid = request.getParameter("jid");
		JobEntity job = jobDao.selectJobByJid(Integer.parseInt(jid));
		request.setAttribute("CUR_JOB", job);
		request.getRequestDispatcher("/WEB-INF/jsp/updateJob.jsp").forward(request,response);
	}

	/**
	 * 职位创建操作
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void createJobDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jobName = request.getParameter("jobName");
		String pay = request.getParameter("pay");
		String reqExperience = request.getParameter("reqExperience");
		String reqEducation = request.getParameter("reqEducation");
		String attract = request.getParameter("attract");
		String description = request.getParameter("description");
		String fid = request.getParameter("fid");
		JobEntity job = new JobEntity();
		job.setJobName(jobName);
		job.setPay(Double.parseDouble(pay));
		job.setReqExperience(reqExperience);
		job.setReqEducation(reqEducation);
		job.setAttract(attract);
		job.setDescription(description);
		if (jobDao.insertJob(job, Integer.parseInt(fid))) {
			response.sendRedirect(request.getContextPath()+"/firm/jobsList");
		} else {
			response.sendRedirect(request.getContextPath()+"/job/create");
		}
	}
	
	/**
	 * 创建新的职位
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void createJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FirmEntity firm = (FirmEntity)request.getSession().getAttribute("CUR_FIRM");
		if (firm == null) {
			request.getRequestDispatcher("/WEB-INF/jsp/createFirm.jsp").forward(request,response);
		}else {
			request.getRequestDispatcher("/WEB-INF/jsp/createJob.jsp").forward(request,response);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
