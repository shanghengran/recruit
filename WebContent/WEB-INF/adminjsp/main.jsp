<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<title>后台主页</title>
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
			<div class="layout-main-body"></div>
		</section>
	</div>
</body>
</html>