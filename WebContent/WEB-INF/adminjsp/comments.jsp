<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta name="keywords" content="">
	<meta name="description" content="。">
	<title>评论管理</title>
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
						<td><b>评论ID</b></td><td><b>关联公司ID</b></td><td><b>关联用户ID</b></td><td><b>评论内容</b></td><td><b>评论时间</b></td><td><b>操作</b></td>
					</tr>
				<c:forEach items="${pager.lists}" var="comments">
					<tr>
					<td>${comments.cid }</td><td>${comments.fid }</td><td>${comments.uid }</td><td>${comments.content }</td><td>${comments.sendTime }</td>
					<td><a href="${pageContext.request.contextPath}/admin/deleteComments?cid=${comments.cid}">删除</a></td>
					</tr>
				</c:forEach>
				</table>
				<c:if test="${pager.pageNow > 1 }">
					<a href="${pageContext.request.contextPath }/admin/comments?pageNow=${pager.pageNow-1 }">[上一页]</a>
				</c:if>
				 <c:forEach var="i" begin="1" end="${pager.pageCount}" step="1">
					<c:if test="${pager.pageNow == i }">
						${i }
					</c:if>
					<c:if test="${pager.pageNow !=i }">
					   <a href="${pageContext.request.contextPath }/admin/comments?pageNow=${i }">${i }</a>
					</c:if>
				 </c:forEach>
				 <c:if test="${pager.pageNow < pager.pageCount }">
					  <a href="${pageContext.request.contextPath }/admin/comments?pageNow=${pager.pageNow+1 }">[下一页]</a>
				 </c:if>
				当前${pager.pageNow }/总共${pager.pageCount }
			</div>
		</section>
	</div>
</body>
</html>