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
    <title>梦之航 - 我的简历</title>
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
    <section class="job-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                    <h3>我的简历</h3>
                </div>
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath }/user/userIndex">主页</a> </li>
                            <li class="active">我的简历</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="dashboard parallex">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="dashboard-header">
                        <div class="col-md-5 col-sm-5 col-xs-12">
                            <div class="user-avatar ">
                                <img src="${pageContext.request.contextPath }/photo/${CUR_USER.photo }" alt="" class="img-responsive center-block "></a>
                                <h3>${resume.realName }</h3>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="rad-info-box rad-txt-success">
                                <i class="icon icon-presentation"></i>
                                <span class="title-dashboard">Followings</span>
                                <span class="value"><span>...</span></span>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="rad-info-box rad-txt-success">
                                <i class="icon icon-aperture"></i>
                                <span class="title-dashboard">Jobs Applied</span>
                                <span class="value"><span>...</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="dashboard-body">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="profile-nav">
                            <div class="panel">
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="active">
                                        <a href="${pageContext.request.contextPath }/resume/myResume"> <i class="fa fa-file-o"></i>我的简历 </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/resume/updateResume"> <i class="fa fa-edit"></i> 编辑简历</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/user/personalCenter"> <i class="fa fa-user"></i> 个人中心</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/user/sendInfoBack"> <i class="fa  fa-list-ul"></i> 求职反馈</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-12">
                        <div class="job-short-detail">
                            <div class="heading-inner">
                                <p class="title">我的简历</p>
                            </div>
                            <dl>
                                <dt>姓名:</dt>
                                <dd>${resume.realName}</dd>

                                <dt>性别:</dt>
                                <dd> <c:if test="${resume.gender == 'male'}">男</c:if><c:if test="${resume.gender == 'female'}">女</c:if></dd>

                                <dt>年龄:</dt>
                                <dd> ${resume.age } </dd>

                                <dt>电话:</dt>
                                <dd>${resume.phone } </dd>

                                <dt>教育程度:</dt>
                                <dd>
                                    <c:if test="${resume.education == '小学'}">小学</c:if>
                                    <c:if test="${resume.education == '初中'}">初中</c:if>
                                    <c:if test="${resume.education == '高中'}">高中</c:if>
                                    <c:if test="${resume.education == '大专'}">大专</c:if>
                                    <c:if test="${resume.education == '本科'}">本科</c:if>
                                    <c:if test="${resume.education == '硕士'}">硕士</c:if>
                                    <c:if test="${resume.education == '博士'}">博士</c:if>
                                </dd>

                                <dt>工作经验:</dt>
                                <dd>
                                    <c:if test="${resume.experience == '应届毕业生'}">应届毕业生</c:if>
                                    <c:if test="${resume.experience == '3年及以下'}">3年及以下</c:if>
                                    <c:if test="${resume.experience == '3-5年'}">3-5年</c:if>
                                    <c:if test="${resume.experience == '5-10年'}">5-10年</c:if>
                                    <c:if test="${resume.experience == '10年以上'}">10年以上</c:if>
                                </dd>

                                <dt>求职意向:</dt>
                                <dd>${resume.intention } </dd>

                                <dt>期望薪资:</dt>
                                <dd>￥${resume.salary }</dd>

                                <dt>简历附件:</dt>
                                <dd><c:if test="${not empty resume.rFile }"><a href="${pageContext.request.contextPath }/files/${resume.rFile}" target="_blank"><img src="${pageContext.request.contextPath }/files/${resume.rFile}" width="auto" height="20px"></a></c:if>
                                    <c:if test="${empty resume.rFile }">无附件</c:if>
                                </dd>

                            </dl>
                        </div>

                        <div class="heading-inner">
                            <p class="title">个人简介</p>
                        </div>
                        <p>${resume.introduction }</p>

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
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--<title>个人简历</title>--%>
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/myResume_style.css"/>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/header_style.css"/>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bg_style.css"/>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/foot.css"/>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div>--%>
<%--<c:if test="${CUR_USER == null }">--%>
	<%--<div class="header">--%>
	     <%--<a href="${pageContext.request.contextPath }/user/login"><img height="20px" src="${pageContext.request.contextPath }/photo/loginlogo.png"> 登录</a>/ --%>
	    <%--<a href="${pageContext.request.contextPath }/user/reg">注册</a> &nbsp;&nbsp;--%>
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
<%--<div id="recruitImg">--%>
	<%--<a href="${pageContext.request.contextPath }/user/userIndex"><img src="${pageContext.request.contextPath }/photo/recruitImg.png"></a>--%>
<%--</div>--%>
<%--<div id="bg_style">--%>
	<%--<img id="bg_s" src="${pageContext.request.contextPath }/photo/bg.jpg" alt=""/>    --%>
<%--</div>--%>
<%--<div id="resume_info_div">--%>
<%--<table id="table_size">--%>
    <%--<tr>--%>
        <%--<td align="right" width="25%"><span><span style="color:red">*</span>姓名：</span></td><td width="65%"><input class="information" type="text" name="realName" readonly="readonly" value="${resume.realName }"></td><td width="10%"><a href="#" onclick="blockDiv_update_realName()">修改</a></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td>--%>
        <%--<td colspan="2" align="left">--%>
            <%--<div class="resumeInfo" id="resume_realName">--%>
            	<%--<form action="${pageContext.request.contextPath }/resume/updateResumeRealName" method="post">--%>
                	<%--<input type="text" name="newRealName"/><br/>--%>
                	<%--<input type="submit" value="保存"/>--%>
            	<%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td align="right"><span><span style="color:red">*</span>性别：</span></td><td><input class="information" type="text" name="gender" readonly="readonly" value="${resume.gender =='male' ? '男' : '女' }"></td><td><a href="#" onclick="blockDiv_update_gender()">修改</a></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td>--%>
        <%--<td colspan="2" align="left">--%>
            <%--<div class="resumeInfo" id="resume_gender">--%>
            	<%--<form action="${pageContext.request.contextPath }/resume/updateResumeGender" method="post">--%>
                	<%--<input type="radio" name="newGender" value="male"/>男--%>
            		<%--<input type="radio" name="newGender" value="female"/>女<br/>--%>
            		<%--<input type="submit" value="保存"/>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td align="right"><span><span style="color:red">*</span>年龄：</span></td><td><input class="information" type="text" name="age" readonly="readonly" value="${resume.age }"></td><td><a href="#" onclick="blockDiv_update_age()">修改</a></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td>--%>
        <%--<td colspan="2" align="left">--%>
            <%--<div class="resumeInfo" id="resume_age">--%>
            	<%--<form action="${pageContext.request.contextPath }/resume/updateResumeAge" method="post">--%>
                	<%--<input type="text" name="newAge"/><br/>--%>
                	<%--<input type="submit" value="保存"/>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
            <%--<td align="right"><span><span style="color:red">*</span>电话：</span></td><td><input class="information" type="text" name="phone" readonly="readonly" value="${resume.phone }"></td><td><a href="#" onclick="blockDiv_update_phone()">修改</a></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td>--%>
        <%--<td colspan="2" align="left">--%>
            <%--<div class="resumeInfo" id="resume_phone">--%>
            	<%--<form action="${pageContext.request.contextPath }/resume/updateResumePhone">--%>
                	<%--<input type="text" name="newPhone"/><br/>--%>
                	<%--<input type="submit" value="保存"/>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td align="right"><span><span style="color:red">*</span>学历：</span></td><td><input class="information" type="text" name="education" readonly="readonly" value="${resume.education }"></td><td><a href="#" onclick="blockDiv_update_education()">修改</a></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td>--%>
        <%--<td colspan="2" align="left">--%>
            <%--<div class="resumeInfo" id="resume_education">--%>
            	<%--<form action="${pageContext.request.contextPath }/resume/updateResumeEducation" method="post">--%>
               		<%--<select name="newEducation">--%>
               <%--<option value="小学">小学</option>--%>
               <%--<option value="初中">初中</option>--%>
               <%--<option value="高中">高中</option>--%>
               <%--<option value="大专">大专</option>--%>
               <%--<option value="本科">本科</option>--%>
               <%--<option value="硕士">硕士</option>--%>
               <%--<option value="博士">博士</option>--%>
              <%--</select><br/>--%>
               		<%--<input type="submit" value="保存"/>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td align="right"><span><span style="color:red">*</span>工作经验：</span></td><td><input class="information" type="text" name="experience" readonly="readonly" value="${resume.experience }"></td><td><a href="#" onclick="blockDiv_update_experience()">修改</a></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td>--%>
        <%--<td colspan="2" align="left">--%>
            <%--<div class="resumeInfo" id="resume_experience">--%>
                <%--<form action="${pageContext.request.contextPath }/resume/updateResumeExperience" method="post">--%>
                	<%--<select name="newExperience">--%>
                  <%--<option value="应届毕业生">应届毕业生</option>--%>
                  <%--<option value="3年及以下">3年及以下</option>--%>
                  <%--<option value="3-5年">3-5年</option>--%>
                  <%--<option value="5-10年">5-10年</option>--%>
                  <%--<option value="10年以上">10年以上</option>--%>
              <%--</select><br/>--%>
                	<%--<input type="submit" value="保存"/>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td align="right"><span><span style="color:red">*</span>求职意向：</span></td><td><input class="information" type="text" name="intention" readonly="readonly" value="${resume.intention }"></td><td><a href="#" onclick="blockDiv_update_intention()">修改</a></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td>--%>
        <%--<td colspan="2" align="left">--%>
            <%--<div class="resumeInfo" id="resume_intention">--%>
                <%--<form action="${pageContext.request.contextPath }/resume/updateResumeIntention" method="post">--%>
                <%--<input type="text" name="newIntention"/><br/>--%>
                <%--<input type="submit" value="保存"/>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td align="right"><span><span style="color:red">*</span>期望工资：</span></td><td><input class="information" type="text" name="salary" readonly="readonly" value="${resume.salary }"></td><td><a href="#" onclick="blockDiv_update_salary()">修改</a></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td>--%>
        <%--<td colspan="2" align="left">--%>
            <%--<div class="resumeInfo" id="resume_salary">--%>
                <%--<form action="${pageContext.request.contextPath }/resume/updateResumeSalary" method="post">--%>
                	<%--<input type="text" name="newSalary"/><br/>--%>
                	<%--<input type="submit" value="保存"/>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td align="right"><span><span style="color:red">*</span>个人简介：</span></td><td></td><td><a href="#" onclick="blockDiv_update_introduction()">修改</a></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td><td><textarea id="show" readonly="readonly" name="introduction">${resume.introduction }</textarea></td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
    	<%--<td></td>--%>
        <%--<td colspan="2" align="left">--%>
            <%--<div class="resumeInfo" id="resume_introduction">--%>
            	<%--<form action="${pageContext.request.contextPath }/resume/updateResumeIntroduction" method="post">--%>
                	<%--<textarea style="width: 70%" name="newIntroduction"></textarea><br/>--%>
                	<%--<input type="submit" value="保存"/>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td align="right"><span>附件：</span></td>--%>
        <%--<c:if test="${resume.rFile }"><td><img src="${pageContext.request.contextPath }/files/${resume.rFile}" ></td></c:if>--%>
        <%--<c:if test="${empty resume.rFile }"><td>无附件</td></c:if>--%>
        <%--<td><a href="#" onclick="blockDiv_update_rFile()">修改</a></td>--%>
    <%--</tr>--%>
	<%--<tr>--%>
	<%--<td></td>--%>
          <%--<td colspan="2" align="left">--%>
              <%--<div class="resumeInfo" id="resume_rFile">--%>
              	<%--<form action="${pageContext.request.contextPath }/resume/updateResumeRFile" method="post" enctype="multipart/form-data">--%>
                	<%--<input type="file" name="newRFile"/><br/>--%>
                	<%--<input type="submit" value="保存"/>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</td>--%>
    <%--</tr>--%>
<%--</table>--%>
<%--</div>--%>
<%--</c:if>--%>
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