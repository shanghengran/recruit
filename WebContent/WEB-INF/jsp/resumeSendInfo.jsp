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
    <title>梦之航 - 求职反馈</title>
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
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/resumeSendInfo_style.css"/>--%>

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
                    <h3>求职反馈</h3>
                </div>
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath }/user/userIndex">主页</a> </li>
                            <li class="active">求职反馈</li>
                        </ol>
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
                        <div class="profile-card">
                            <div class="banner">
                                <img src="${pageContext.request.contextPath }/basic/images/building.jpg" alt="" class="img-responsive">
                            </div>
                            <div class="user-image">
                                <img src="${pageContext.request.contextPath }/photo/${CUR_USER.photo }" class="img-responsive img-circle" alt="">
                            </div>
                            <div class="card-body">
                                <h3>${CUR_USER.username }</h3>
                            </div>
                            <ul class="social-network social-circle onwhite">
                                <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#" class="icoLinkedin" title="Linkedin +"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                        <div class="profile-nav">
                            <div class="panel">
                                <ul class="nav nav-pills nav-stacked">
                                    <li>
                                        <a href="${pageContext.request.contextPath }/resume/myResume"> <i class="fa fa-file-o"></i>我的简历 </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/resume/updateResume"> <i class="fa fa-edit"></i> 编辑简历</a>
                                    </li>
                                    <li>
                                    <a href="${pageContext.request.contextPath }/user/personalCenter"> <i class="fa fa-user"></i> 个人中心</a>
                                    </li>
                                    <li class="active">
                                        <a href="${pageContext.request.contextPath }/user/sendInfoBack"> <i class="fa  fa-list-ul"></i> 求职反馈</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-12">
                        <div class="heading-inner first-heading">
                            <p class="title">求职反馈</p>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                            <div class="profile-edit row">
                                <nav id="menu-1" class="mega-menu fa-change-black" data-color="">
                                    <section class="menu-list-items">
                                        <ul class="menu-links pull-left">
                                            <li class="active" id="sendSuccess_li"> <a href="javascript:void(0)" id="sendSuccess_a"> 投递成功 </a>
                                            </li>
                                            <li id="beLooked_li"> <a href="javascript:void(0)" id="beLooked_a"> 已查看 </a>
                                            </li>
                                            <li id="interest_li"> <a href="javascript:void(0)" id="interest_a"> 感兴趣 </a>
                                            </li>
                                            <li id="yaoqing_li"> <a href="javascript:void(0)" id="yaoqing_a"> 邀请面试 </a>
                                            </li>
                                            <li id="interview_li"> <a href="javascript:void(0)" id="interview_a"> 已面试 </a>
                                            </li>
                                            <div id="sendSuccess" style="display:block;">
                                                <c:forEach items="${sendSuccess }" var="sendSuccess">
                                                    <span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${sendSuccess.fid }&jid=${sendSuccess.jid }">${sendSuccess.firmName }</a></span><span>企业的职位：${sendSuccess.jobName }  </span><hr/>
                                                </c:forEach>
                                            </div>
                                            <div id="beLooked" style="display:none;">
                                                <c:forEach items="${belooked }" var="belooked">
                                                    <span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${belooked.fid }&jid=${belooked.jid }">${belooked.firmName }</a></span><span>企业的职位：${belooked.jobName }  </span><hr/>
                                                </c:forEach>
                                            </div>
                                            <div id="interest" style="display:none;">
                                                <c:forEach items="${interest }" var="interest">
                                                    <span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${interest.fid }&jid=${interest.jid }">${interest.firmName }</a></span><span>企业的职位：${interest.jobName }  </span><hr/>
                                                </c:forEach>
                                            </div>
                                            <div id="yaoqing" style="display:none;">
                                                <c:forEach items="${interviewBefore }" var="interviewBefore">
                                                    <span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${interviewBefore.fid }&jid=${interviewBefore.jid }">${interviewBefore.firmName }</a></span><span>企业的职位：${interviewBefore.jobName }  </span><hr/>
                                                </c:forEach>
                                            </div>
                                            <div id="interview" style="display:none;">
                                                <c:forEach items="${interviewAfter }" var="interviewAfter">
                                                    <span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${interviewAfter.fid }&jid=${interviewAfter.jid }">${interviewAfter.firmName }</a></span><span>企业的职位：${interviewAfter.jobName }  </span><hr/>
                                                </c:forEach>
                                            </div>
                                        </ul>
                                    </section>
                                </nav>
                            </div>
                        </div>
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
<script>
    $(function(){
        $("#sendSuccess_a").click(function () {
            $("#sendSuccess_li").attr("class","active");
            $("#beLooked_li").removeAttr("class");
            $("#interest_li").removeAttr("class");
            $("#yaoqing_li").removeAttr("class");
            $("#interview_li").removeAttr("class");
            $("#sendSuccess").css("display","block");
            $("#beLooked").css("display","none");
            $("#interest").css("display","none");
            $("#yaoqing").css("display","none");
            $("#interview").css("display","none");
        });
        $("#beLooked_a").click(function () {
            $("#sendSuccess_li").removeAttr("class");
            $("#beLooked_li").attr("class","active");
            $("#interest_li").removeAttr("class");
            $("#yaoqing_li").removeAttr("class");
            $("#interview_li").removeAttr("class");
            $("#sendSuccess").css("display","none");
            $("#beLooked").css("display","block");
            $("#interest").css("display","none");
            $("#yaoqing").css("display","none");
            $("#interview").css("display","none");
        });
        $("#interest_a").click(function () {
            $("#sendSuccess_li").removeAttr("class");
            $("#beLooked_li").removeAttr("class");
            $("#interest_li").attr("class","active");
            $("#yaoqing_li").removeAttr("class");
            $("#interview_li").removeAttr("class");
            $("#sendSuccess").css("display","none");
            $("#beLooked").css("display","none");
            $("#interest").css("display","block");
            $("#yaoqing").css("display","none");
            $("#interview").css("display","none");
        });
        $("#yaoqing_a").click(function () {
            $("#sendSuccess_li").removeAttr("class");
            $("#beLooked_li").removeAttr("class");
            $("#interest_li").removeAttr("class");
            $("#yaoqing_li").attr("class","active");
            $("#interview_li").removeAttr("class");
            $("#sendSuccess").css("display","none");
            $("#beLooked").css("display","none");
            $("#interest").css("display","none");
            $("#yaoqing").css("display","block");
            $("#interview").css("display","none");
        });
        $("#interview_a").click(function () {
            $("#sendSuccess_li").removeAttr("class");
            $("#beLooked_li").removeAttr("class");
            $("#interest_li").removeAttr("class");
            $("#yaoqing_li").removeAttr("class");
            $("#interview_li").attr("class","active");
            $("#sendSuccess").css("display","none");
            $("#beLooked").css("display","none");
            $("#interest").css("display","none");
            $("#yaoqing").css("display","none");
            $("#interview").css("display","block");
        });
    });
</script>
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
<%--<title>求职进展</title>--%>
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/header_style.css"/>--%>
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bg_style.css"/>--%>
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/resumeSendInfo_style.css"/>--%>
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/foot.css"/>--%>
    <%--<script src="${pageContext.request.contextPath }/js/firm.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
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
<%--</c:if>--%>
<%--<div id="recruitImg">--%>
	<%--<a href="${pageContext.request.contextPath }/user/userIndex"><img src="${pageContext.request.contextPath }/photo/recruitImg.png"></a>--%>
<%--</div>--%>
<%--<div id="bg_style">--%>
	<%--<img id="bg_s" src="${pageContext.request.contextPath }/photo/bg.jpg" alt=""/>    --%>
<%--</div>--%>
<%--<div id="send_info">--%>
<%--<ul>--%>
    <%--<li id="successT" onclick="blockDiv_sendSuccess_div()">投递成功--%>
        <%--<div class="resumeBack_status_div" id="sendSuccess" style="display:block;">--%>
            <%--<c:forEach items="${sendSuccess }" var="sendSuccess">--%>
                <%--<span>${sendSuccess.jobName }  </span><span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${sendSuccess.fid }&jid=${sendSuccess.jid }">${sendSuccess.firmName }</a></span><hr/>--%>
            <%--</c:forEach>--%>
        <%--</div>--%>
    <%--</li>--%>
    <%--<li id="lookedT" onclick="blockDiv_beLooked_div()">已查看--%>
        <%--<div class="resumeBack_status_div" id="beLooked">--%>
            <%--<c:forEach items="${belooked }" var="belooked">--%>
                <%--<span>${belooked.jobName }  </span><span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${belooked.fid }&jid=${belooked.jid }">${belooked.firmName }</a></span><hr/>--%>
            <%--</c:forEach>--%>
        <%--</div>--%>
    <%--</li>--%>
    <%--<li id="interestT" onclick="blockDiv_interest_div()">感兴趣--%>
        <%--<div class="resumeBack_status_div" id="interest">--%>
            <%--<c:forEach items="${interest }" var="interest">--%>
                <%--<span>${interest.jobName }  </span><span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${interest.fid }&jid=${interest.jid }">${interest.firmName }</a></span><hr/>--%>
            <%--</c:forEach>--%>
        <%--</div>--%>
    <%--</li>--%>
    <%--<li id="beforeT" onclick="blockDiv_yaoqing_div()">邀请面试--%>
        <%--<div class="resumeBack_status_div" id="yaoqing">--%>
            <%--<c:forEach items="${interviewBefore }" var="interviewBefore">--%>
                <%--<span>${interviewBefore.jobName }  </span><span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${interviewBefore.fid }&jid=${interviewBefore.jid }">${interviewBefore.firmName }</a></span><hr/>--%>
            <%--</c:forEach>--%>
        <%--</div>--%>
    <%--</li>--%>
    <%--<li id="afterT" onclick="blockDiv_notSuit_div()">已面试--%>
        <%--<div class="resumeBack_status_div" id="notSuit">--%>
            <%--<c:forEach items="${interviewAfter }" var="interviewAfter">--%>
                <%--<span>${interviewAfter.jobName }  </span><span><a href="${pageContext.request.contextPath }/user/viewFirm?fid=${interviewAfter.fid }&jid=${interviewAfter.jid }">${interviewAfter.firmName }</a></span><hr/>--%>
            <%--</c:forEach>--%>
        <%--</div>--%>
    <%--</li>--%>
<%--</ul>--%>
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