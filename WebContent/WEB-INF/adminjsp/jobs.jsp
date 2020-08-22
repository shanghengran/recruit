<%@page import="com.recruit.entity.JobEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>职位管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/sccl.css"/>
</head>
<body>
	<div class="layout-admin">
		<header class="layout-header">
			<span class="header-logo">欢迎使用梦之航后台管理</span>
			<a class="header-menu-btn" href="javascript:;"><i class="icon-font">&#xe600;</i></a>
			<ul class="header-bar">
				<li class="header-bar-nav"><a href="${pageContext.request.contextPath }/admin/login">切换账户</a></li>
				<li class="header-bar-nav"><a href="${pageContext.request.contextPath }/admin/quit">退出</a></li>
			</ul>
		</header>
		<aside class="layout-side">
			<img src="${pageContext.request.contextPath }/img/web_logo_1.png" width="200" height="100" style="margin-top: 20px"/>
		</aside>

		<div class="layout-side-arrow"><div class="layout-side-arrow-icon"><i class="icon-font">&#xe60d;</i></div></div>

		<section class="layout-main">
			<div class="layout-main-tab">
				<div class="tab-nav-content">
					<a href="${pageContext.request.contextPath }/admin/user" style="padding-left: 20px">用户管理界面</a>&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/admin/resume">简历管理界面</a>&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/admin/firm">公司管理界面</a>&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/admin/job">职位管理界面</a>&nbsp;|&nbsp;
					<a href="${pageContext.request.contextPath }/admin/comments">评论管理界面</a>
				</div>
				</div>
			<div class="layout-main-body">
				<table style="width: 100%">
					<tr>
						<td><b>职位ID</b></td><td><b>关联公司ID</b></td><td><b>职位名称</b></td><td><b>职位薪资</b></td><td><b>工作经验要求</b></td>
						<td><b>学历要求</b></td><td><b>职位诱惑</b></td><td><b>职位描述</b></td><td><b>操作</b></td>
					</tr>
				<c:forEach items="${pager.lists }" var="jobs" >
					<tr>
						<td>${jobs.jid }</td>
						<td>${jobs.fid }</td>
						<td>${jobs.jobName }</td>
						<td>${jobs.pay }</td>
						<td>${jobs.reqExperience }</td>
						<td>${jobs.reqEducation }</td>
						<td>${jobs.attract }</td>
						<td>${jobs.description }</td>
						<td><a href="${pageContext.request.contextPath}/admin/deleteJob?jid=${jobs.jid}">删除</a></td>
					</tr>
				</c:forEach>
				</table>
				<c:if test="${pager.pageNow > 1 }">
					<a href="${pageContext.request.contextPath }/admin/job?pageNow=${pager.pageNow-1 }">[上一页]</a>
				</c:if>

				<c:forEach var="i" begin="1" end="${pager.pageCount}" step="1">
					<c:if test="${pager.pageNow == i }">
						${i }
					</c:if>
					<c:if test="${pager.pageNow !=i }">
					   <a href="${pageContext.request.contextPath }/admin/job?pageNow=${i }">${i }</a>
					</c:if>
				</c:forEach>

			   <c:if test="${pager.pageNow < pager.pageCount }">
					<a href="${pageContext.request.contextPath }/admin/job?pageNow=${pager.pageNow+1 }">[下一页]</a>
			   </c:if>
			   当前${pager.pageNow }/总共${pager.pageCount }
			</div>
		</section>
	</div>
</body>
</html>



