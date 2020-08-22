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
	<title>梦之航 - 专业的互联网招聘网站</title>
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
	<section class="main-section parallex">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-sm-12 col-md-offset-1 col-xs-12 nopadding">
					<div class="search-form-contaner">
						<h1 class="search-main-title"> Ten million success stories. Start yours today </h1>
						<form class="form-inline" action="${pageContext.request.contextPath }/user/searchJobs" method="post">
							<div class="col-md-10 col-sm-10 col-xs-12 nopadding">
								<div class="form-group">

									<input type="text" class="form-control" name="jobName" placeholder="搜索关键字..." value="">
									<i class="icon-magnifying-glass"></i>
								</div>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12 nopadding">
								<div class="form-group form-action">
									<button type="submit" class="btn btn-default btn-search-submit">搜索 <i class="fa fa-angle-right"></i> </button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="cat-tabs cat-tab-index-2">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="cat-title">搜索结果浏览</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<!-- Tabs -->
								<ul class="nav panel-tabs">
									<li> <a href="#" data-toggle="tab"><i class="icofont icon-ribbon"></i><span class="hidden-xs hidden-sm">职位名称</span></a> </li>
									<li> <a href="#" data-toggle="tab"><i class="icofont icon-linegraph"></i><span class="hidden-xs hidden-sm">薪资</span></a> </li>
									<li> <a href="#" data-toggle="tab"><i class="icofont icon-briefcase"></i><span class="hidden-xs hidden-sm">工作经验</span></a> </li>
									<li> <a href="#" data-toggle="tab"><i class="icofont icon-layers"></i><span class="hidden-xs hidden-sm">学历</span></a> </li>
									<li> <a href="#" data-toggle="tab"><i class="icofont icon-global"></i><span class="hidden-xs hidden-sm">企业名称</span></a> </li>
								</ul>
							</div>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="animated fadeInUp" id="tab3" >
									<div class="col-md-12 col-sm-12 col-xs-12 nopadding">
										<c:forEach items="${SEARCH }" var="job">
											<div class="job-box">
												<div class="col-md-3 col-sm-3 col-xs-12">
													<div class="job-title-box">
														<a href="${pageContext.request.contextPath }/resume/viewJob?jid=${job.jid}">
															<div class="job-title" style="padding-left: 30px;padding-top: 10px ">${job.jobName }</div></a>
													</div>
												</div>
												<div class="col-md-2 col-sm-2 col-xs-12 nopadding hidden-xs hidden-sm">
													<div class="job-type jt-part-time-color"style="padding-left: 30px;"> ￥${job.pay } </div>
												</div>
												<div class="col-md-2 col-sm-2 col-xs-6">
													<div class="job-type jt-remote-color" style="text-align: center">  ${job.reqExperience } </div>
												</div>
												<div class="col-md-3 col-sm-3 col-xs-6">
													<div class="job-type jt-full-time-color" style="text-align: center"> ${job.reqEducation } </div>
												</div>
												<div class="col-md-2 col-sm-2 col-xs-12">
													<button class="btn btn-primary btn-custom"><i class="fa fa-location-arrow"></i>&nbsp;<a href="${pageContext.request.contextPath }/user/viewFirm?fid=${job.jid}">${job.firm.firmName}</a></button>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="facts">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3 col-xs-6">
					<div class="fact-box">
						<div class="single-facts-area">
							<div class="facts-icon"> <i class="icon-megaphone"></i> </div>
							<span class="counter">${count_job}</span>
							<h3>Jobs</h3>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-xs-6">
					<div class="fact-box">
						<div class="single-facts-area">
							<div class="facts-icon"> <i class="icon-document"></i> </div>
							<span class="counter">${count_resume}</span>
							<h3> Resume </h3>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-xs-6">
					<div class="fact-box">
						<div class="single-facts-area">
							<div class="facts-icon"> <i class="icon-profile-male"></i> </div>
							<span class="counter">${count_user}</span>
							<h3>Members</h3>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-xs-6">
					<div class="fact-box">
						<div class="single-facts-area">
							<div class="facts-icon"> <i class="icon-toolbox"></i> </div>
							<span class="counter">${count_firm}</span>
							<h3>Company</h3>
						</div>
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
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<!DOCTYPE html">--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--<title>职位搜索</title>--%>
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/searchJobs_style.css"/>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/header_style.css"/>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bg_style.css"/>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/foot.css"/>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:if test="${CUR_USER == null }">--%>
	<%--<div class="header">--%>
	    <%--<a href="${pageContext.request.contextPath }/user/login"><img height="20px" src="${pageContext.request.contextPath }/photo/loginlogo.png"> 登录 </a>/ --%>
	    <%--<a href="${pageContext.request.contextPath }/user/reg"> 注册</a> &nbsp;--%>
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
	<%--<a href="${pageContext.request.contextPath }/user/userIndex"><img src="${pageContext.request.contextPath }/photo/recruitImg.png"></a>--%>
<%--</div>--%>
<%--<div id="bg_style">--%>
	<%--<img id="bg_s" src="${pageContext.request.contextPath }/photo/bg.jpg" alt=""/>    --%>
<%--</div>--%>
<%--<div style="left: 25%;top: 5%;position: absolute;">--%>
			<%--<form action="${pageContext.request.contextPath }/user/searchJobs" method="post">--%>
			<%--<div class="d2">--%>
                <%--<input type="text" name="jobName"  size="60"  placeholder=" 请输入你要搜索的职位 :" style="height:35px; color:#999; font-size:14px;"/>--%>
            <%--</div>--%>
            <%--<div class="d3"><div class="dd"><input style="width: 60px;height: 35px" type="submit" value="搜索"/></div></div>--%>
            <%--</form>--%>
<%--</div>--%>

<%--<div id="job_info">--%>
<%--<c:forEach items="${SEARCH }" var="job">--%>
<%--<table>--%>
	<%--<tr>--%>
		<%--<th style="width: 25%">职位名称</th>--%>
		<%--<th style="width: 25%">薪水</th>--%>
		<%--<th style="width: 25%">工作经验</th>--%>
		<%--<th style="width: 25%">学历</th>--%>
	<%--</tr>--%>
	<%--<tr>--%>
		<%--<td style="width: 25%">--%>
		<%--<a href="${pageContext.request.contextPath }/resume/viewJob?jid=${job.jid}">${job.jobName }</a></td>--%>
		<%--<td style="width: 25%">${job.pay }</td><td style="width: 25%">${job.reqExperience }</td>--%>
		<%--<td style="width: 25%">${job.reqEducation }</td>--%>
	<%--</tr>--%>
<%--</table>--%>
<%--<br/>--%>
<%--</c:forEach>--%>
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