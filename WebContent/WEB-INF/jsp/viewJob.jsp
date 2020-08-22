<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<!--[if IE]>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<![endif]-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ScriptsBundle">
	<title>梦之航 - 职位详情</title>
	<link rel="icon" href="${pageContext.request.contextPath }/basic/images/favicon.ico" type="image/x-icon">

	<!-- BOOTSTRAPE STYLESHEET CSS FILES -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/bootstrap.min.css">

	<!-- JQUERY SELECT -->
	<link href="${pageContext.request.contextPath }/basic/css/select2.min.css" rel="stylesheet" />

	<!-- JQUERY MENU -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/mega_menu.min.css">

	<!-- ANIMATION -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/animate.min.css">

	<!-- OWl  CAROUSEL-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/owl.carousel.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/owl.style.css">

	<!-- TEMPLATE CORE CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/style.css">

	<!-- FONT AWESOME -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/basic/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/et-line-fonts.css" type="text/css">

	<!-- Google Fonts -->
	<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">

	<!-- Custom Style -->

	<!-- JavaScripts -->
	<script src="${pageContext.request.contextPath }/basic/js/modernizr.js"></script>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
<div class="page">
	<div id="spinner">
		<div class="spinner-img"> <img alt="Opportunities Preloader" src="${pageContext.request.contextPath }/basic/images/loader.gif" />
			<h2>Please Wait.....</h2>
		</div>
	</div>
	<nav id="menu-1" class="mega-menu fa-change-black" data-color="">
		<section class="menu-list-items">
			<ul class="menu-logo">
				<li> <a href="${pageContext.request.contextPath }/user/userIndex"> <img src="${pageContext.request.contextPath }/img/web_logo_3.png" alt="logo" class="img-responsive"> </a> </li>
			</ul>
			<ul class="menu-links pull-right">
				<li> <a href="${pageContext.request.contextPath }/user/userIndex"> 主页 </a>
				</li>
				<c:if test="${CUR_USER != null }">
					<li><a href="javascript:void(0)"> <img src="${pageContext.request.contextPath }/photo/${CUR_USER.photo }" class="img-circle" width="36"/>&nbsp;${CUR_USER.username } <i class="fa fa-angle-down fa-indicator"></i></a>
						<ul class="drop-down-multilevel left-side">
							<li><a href="${pageContext.request.contextPath }/resume/myResume"><i class="fa fa-user"></i> 简历信息</a></li>
							<li><a href="${pageContext.request.contextPath }/user/sendInfoBack"><i class="fa fa-mail-forward"></i> 求职反馈</a></li>
							<li><a href="${pageContext.request.contextPath }/user/personalCenter"><i class="fa fa-gear"></i> 个人中心</a></li>
							<li><a href="${pageContext.request.contextPath }/user/quitPerUser"><i class="fa fa-power-off"></i> 退出账号</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${CUR_USER == null }">
					<li class="no-bg login-btn-no-bg"><a href="${pageContext.request.contextPath }/user/login" class="login-header-btn"><i class="fa fa-sign-in"></i> 登录 </a></li>
				</c:if>
			</ul>
		</section>
	</nav>
	<div class="clearfix"></div>
	<div class="search">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 nopadding">
					<form action="${pageContext.request.contextPath }/user/searchJobs" method="post">
						<div class="input-group">
							<div class="input-group-btn search-panel">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <span id="search_concept">搜索</span> </button>
							</div>

							<input type="hidden" name="search_param" value="all" id="search_param">
							<input type="text" class="form-control search-field" name="jobName" placeholder="搜索职位...">
							<span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><span class="fa fa-search"></span></button>
                        </span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<section class="job-breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-7 co-xs-12 text-left">
					<h3>${NOWJOB.jobName }</h3>
				</div>
				<div class="col-md-6 col-sm-5 co-xs-12 text-right">
					<div class="bread">
						<ol class="breadcrumb">
							<li><a href="${pageContext.request.contextPath }/user/userIndex">主页</a> </li>
							<li class="active">职位详情</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="single-job-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 nopadding">
					<div class="col-md-8 col-sm-8 col-xs-12">
						<div class="single-job-page">
							<div class="job-short-detail">
								<div class="heading-inner">
									<p class="title">职位详情</p>
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12 nopadding">
									<dl>
										<dt>职位名称:</dt>
										<dd>${NOWJOB.jobName }</dd>

										<dt>职位薪水:</dt>
										<dd> ${NOWJOB.pay }</dd>

										<dt>工作经验:</dt>
										<dd> ${NOWJOB.reqExperience }</dd>

										<dt>学历:</dt>
										<dd>${NOWJOB.reqEducation }</dd>

									</dl>
								</div>
							</div>

							<div class="heading-inner">
								<p class="title">职位描述</p>
							</div>
							<div class="job-desc job-detail-boxes">
								<p>
									${NOWJOB.description }
								</p>
								<div class="heading-inner">
									<p class="title">职位诱惑:</p>
								</div>
								<ul class="desc-points">
									<li>
										<i class="fa fa-caret-right "></i> ${NOWJOB.attract }
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12">
						<aside>
							<div class="apply-job" style="margin-top: 100px">
								<c:if test="${!isApply }">
									<a href="${pageContext.request.contextPath }/resume/applyJob?jid=${NOWJOB.jid}" class="btn btn-default"><i class="fa fa-upload"></i>申请这个职位</a>
								</c:if>
								<c:if test="${isApply }">
									<a href="javascript:void(0)" class="btn btn-default" style="background-color: #99aeb8"><i class="fa fa-upload"></i>已申请申请这个职位</a>
								</c:if>
								<a class="btn btn-default bookmark"><i class="fa fa-star"></i> 收藏这个职位</a>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
<div class="fixed-footer">
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3 col-xs-12">
					<div class="footer_block"> <a href="${pageContext.request.contextPath }/user/userIndex" class="f_logo"><img src="${pageContext.request.contextPath }/img/web_logo_2.png" class="img-responsive" alt="logo"></a>
						<p>梦之航，梦想起航的地方。<br>人人都是自己梦想的建筑师，<br>但你要做自己成功的设计师。</p>
						<div class="social-bar">
							<ul>
								<li><a class="fa fa-twitter" href="#"></a></li>
								<li><a class="fa fa-pinterest" href="#"></a></li>
								<li><a class="fa fa-facebook" href="#"></a></li>
								<li><a class="fa fa-behance" href="#"></a></li>
								<li><a class="fa fa-instagram" href="#"></a></li>
								<li><a class="fa fa-linkedin" href="#"></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-2 col-xs-12"></div>
				<div class="col-sm-6 col-md-2 col-xs-12">
					<div class="footer_block">
						<h4>Hot Links</h4>
						<ul class="footer-links">
							<li> <a href="${pageContext.request.contextPath }/user/userIndex">Home</a> </li>
							<li> <a href="${pageContext.request.contextPath }/about/jianjie">About Us</a> </li>
							<li> <a href="${pageContext.request.contextPath }/about/fazhan">Our History</a> </li>
							<li> <a href="${pageContext.request.contextPath }/about/wenhua">Enterprise Culture</a> </li>
							<li> <a href="${pageContext.request.contextPath }/about/duihua">Contact Us</a> </li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-md-2 col-xs-12"></div>
				<div class="col-sm-6 col-md-3 col-xs-12">
					<div class="footer_block">
						<h4>Contact Information</h4>
						<ul class="personal-info">
							<li><i class="fa fa-map-marker"></i> 电子科技大学成都学院，成都，四川</li>
							<li><i class="fa fa-envelope"></i> Support@domain.com</li>
							<li><i class="fa fa-phone"></i> (0086)+ 028 1234 5678 </li>
							<li><i class="fa fa-clock-o"></i> Mon - Sun: 9:00 - 17:00</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<section class="footer-bottom-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="footer-bottom">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<p>Copyright ©2019  - All rights Reserved. Made By <a href="#"> 梦之航团队 </a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>

<!-- JAVASCRIPT JS  -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/jquery-2.2.3.min.js"></script>

<!-- BOOTSTRAP CORE JS -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/bootstrap.min.js"></script>

<!-- JQUERY SELECT -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/select2.min.js"></script>

<!-- MEGA MENU -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/mega_menu.min.js"></script>

<!-- JQUERY EASING -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/easing.js"></script>

<!-- JQUERY COUNTERUP -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/counterup.js"></script>

<!-- JQUERY WAYPOINT -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/waypoints.min.js"></script>

<!-- JQUERY REVEAL -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/footer-reveal.min.js"></script>

<!-- Owl Carousel -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/owl-carousel.js"></script>

<!-- CORE JS -->
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/custom.js"></script>

</div>
</body>
</html>

<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
    <%--pageEncoding="UTF-8"%>--%>
    <%--<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
    <%--<meta charset="UTF-8">--%>
    <%--<title>招聘职位信息</title>--%>
     <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/header_style.css"/>--%>
     <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bg_style.css"/>--%>
     <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/viewJob_style.css"/>--%>
     <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/foot.css"/>--%>
     <%--<script src="${pageContext.request.contextPath }/js/firm.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:if test="${CUR_USER == null }">--%>
	<%--<div class="header">--%>
	    <%--<a href="${pageContext.request.contextPath }/user/login"><img height="20px" src="${pageContext.request.contextPath }/photo/loginlogo.png"> 登录 </a>/ --%>
	    <%--<a href="${pageContext.request.contextPath }/user/reg"> 注册</a> --%>
	    <%--<a href="${pageContext.request.contextPath }/user/userIndex">首页</a>&nbsp;--%>
	<%--</div>--%>
<%--</c:if>--%>
<%--<c:if test="${CUR_USER != null }">--%>
 <%--<div class="header">--%>
	<%--<div class="userInfo">--%>
 	<%--<span>&nbsp;您好 ${CUR_USER.username },</span>--%>
	<%--<a href="${pageContext.request.contextPath }/user/quitPerUser ">退出</a> --%>
	<%--</div>--%>
	<%--<a href="${pageContext.request.contextPath }/user/userIndex">首页</a> &nbsp;--%>
	<%--<a href="${pageContext.request.contextPath }/user/personalCenter">个人中心</a> &nbsp;--%>
	<%--<a href="${pageContext.request.contextPath }/resume/myResume">我的简历</a> &nbsp;--%>
	<%--<a href="${pageContext.request.contextPath }/user/sendInfoBack">求职反馈</a> &nbsp;--%>
<%--</div>--%>
<%--</c:if>--%>
<%--<div id="recruitImg">--%>
	<%--<a  href="${pageContext.request.contextPath }/user/userIndex"><img src="${pageContext.request.contextPath }/photo/recruitImg.png"></a>--%>
<%--</div>--%>
<%--<div id="bg_style">--%>
	<%--<img id="bg_s" src="${pageContext.request.contextPath }/photo/bg.jpg" alt=""/>    --%>
<%--</div>--%>
<%--<div id="job-info">--%>
<%--<table style="width: 600px;box-shadow: 0 0 1px #ccc">--%>
	<%--<tr>--%>
		<%--<td style="width: 20%;">职位名称 : </td><td>${NOWJOB.jobName }</td>--%>
	<%--</tr>--%>
	<%--<tr>--%>
		<%--<td>职位薪水 : </td><td>${NOWJOB.pay }</td>--%>
	<%--</tr>--%>
	<%--<tr>--%>
		<%--<td>工作经验 : </td><td>${NOWJOB.reqExperience }</td>--%>
	<%--</tr>--%>
	<%--<tr>--%>
		<%--<td>学历 : </td><td>${NOWJOB.reqEducation }</td>--%>
	<%--</tr>--%>
	<%--<tr>--%>
		<%--<td>职位诱惑 : </td><td></td>--%>
	<%--</tr>--%>
	<%--<tr>--%>
		<%--<td></td><td>${NOWJOB.attract }</td>--%>
	<%--</tr>--%>
	<%--<tr>--%>
		<%--<td>职位描述 : </td><td></td>--%>
	<%--</tr>--%>
	<%--<tr>--%>
		<%--<td></td><td>${NOWJOB.description }</td>--%>
	<%--</tr>--%>
	<%--<tr>--%>
		<%--<td colspan="2">--%>
			<%--<c:if test="${!isApply }">--%>
				<%--<a href="${pageContext.request.contextPath }/resume/applyJob?jid=${NOWJOB.jid}"><b>申请工作</b></a>--%>
			<%--</c:if>--%>
			<%--<c:if test="${isApply }">--%>
				<%--<span><b>已申请</b></span>--%>
			<%--</c:if>--%>
		<%--</td>--%>
	<%--</tr>--%>
<%--</table>--%>
<%--</div>--%>
<%--<div class="null"></div>--%>
<%--<footer>--%>
   <%--<div class="foot">--%>
       <%--<a href="${pageContext.request.contextPath }/about/jianjie">关于我们</a> |--%>
       <%--<a href="${pageContext.request.contextPath }/about/duihua">广告合作</a> |--%>
       <%--<span class="rights">Copyright  2018.Company name All rights reserved.梦之航团队</span>--%>
   <%--</div>--%>
<%--</footer>--%>
<%--</body>--%>
<%--</html>--%>