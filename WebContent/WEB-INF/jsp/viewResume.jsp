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
    <title>梦之航 - 查看简历信息</title>
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

    <!-- TOASTER CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/toastr.min.css">

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
                <li> <a href="${pageContext.request.contextPath }/firm/firmIndex"> <img src="${pageContext.request.contextPath }/img/web_logo_3.png" alt="logo" class="img-responsive"> </a> </li>
            </ul>
            <ul class="menu-links pull-right">
                <li> <a href="${pageContext.request.contextPath }/firm/firmIndex"> 主页 </a></li>
                <li class="no-bg"><a href="${pageContext.request.contextPath }/job/createJob" class="p-job"><i class="fa fa-plus-square"></i> 发布工作</a></li>
                <c:if test="${CUR_USER != null }">
                    <li><a href="javascript:void(0)"> <img src="${pageContext.request.contextPath }/photo/${CUR_USER.photo }" class="img-circle" width="36"/>&nbsp;${CUR_USER.username } <i class="fa fa-angle-down fa-indicator"></i></a>
                        <ul class="drop-down-multilevel left-side">
                            <li><a href="${pageContext.request.contextPath }/firm/firmIndex"><i class="fa fa-user"></i> 企业信息</a></li>
                            <li><a href="${pageContext.request.contextPath }/firm/myCenter"><i class="fa fa-gear"></i> 个人中心</a></li>
                            <li><a href="${pageContext.request.contextPath }/firm/resumesList"><i class="fa fa-file-o"></i> 简历申请列表</a></li>
                            <li><a href="${pageContext.request.contextPath }/firm/jobsList"><i class="fa fa-list-ul"></i> 发布职位列表</a></li>
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
    <section class="job-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                    <h3>查看简历信息</h3>
                </div>
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath }/firm/firmIndex">主页</a></li>
                            <li><a href="${pageContext.request.contextPath }/firm/resumesList">简历申请列表</a></li>
                            <li class="active">查看简历信息</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="light-grey">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="col-md-4 col-sm-4 col-xs-12 col-md-push-8">
                        <div class="heading-inner" style="margin-top: -20px">
                            <p class="title light-grey">对本简历进行操作</p>
                        </div>
                        <div class="resume-social">
                            <ul class="social-network social-circle onwhite">
                                <li><a href="${pageContext.request.contextPath }/job/isInterest?rid=${resume.rid }&jid=${JID}" class="icoTwitter" style="width: 300px;"><h4>感兴趣</h4></a></li>
                                <br><br>
                                <li><a href="${pageContext.request.contextPath }/job/isInterviewBefore?rid=${resume.rid }&jid=${JID}" class="icoLinkedin" style="width: 300px;"><h4>待面试</h4></a></li>
                                <br><br>
                                <li><a href="${pageContext.request.contextPath }/job/isInterviewAfter?rid=${resume.rid }&jid=${JID}" class="icoFacebook" style="width: 300px;"><h4>已面试</h4></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-12 col-md-pull-4">

                        <div class="resume-box">
                            <div class="heading-inner" style="margin-top: -20px">
                                <p class="title light-grey">简历信息</p>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="my-contact">
                                        <div class="contact-icon">
                                            <span class=" icon-ribbon"></span>
                                            <span class="icon"></span>
                                        </div>
                                        <div class="contact-info">
                                            <h4>姓名: </h4>
                                            <p>${resume.realName }</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="my-contact">
                                        <div class="contact-icon">
                                            <span class="icon-profile-male"></span>
                                        </div>
                                        <div class="contact-info">
                                            <h4>性别: </h4>
                                            <p>${resume.gender == "male"?"男":"女"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="my-contact">
                                        <div class="contact-icon">
                                            <span class=" icon-tablet"></span>
                                        </div>
                                        <div class="contact-info">
                                            <h4>电话: </h4>
                                            <p><a href="tel:+9911154849901">${resume.phone }</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="my-contact">
                                        <div class="contact-icon">
                                            <span class="icon-calendar"></span>
                                            <span class="icon"></span>
                                        </div>
                                        <div class="contact-info">
                                            <h4>年龄: </h4>
                                            <p>${resume.age }</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="my-contact">
                                        <div class="contact-icon">
                                            <span class="icon-book-open"></span>
                                        </div>
                                        <div class="contact-info">
                                            <h4>学历: </h4>
                                            <p><a href="mailto:resume@user.com">${resume.education }</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="my-contact">
                                        <div class="contact-icon">
                                            <span class="icon-briefcase"></span>
                                        </div>
                                        <div class="contact-info">
                                            <h4>工作经验: </h4>
                                            <p><a href="tel:+9911154849901">${resume.experience }</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="my-contact">
                                        <div class="contact-icon">
                                            <span class=" icon-heart"></span>
                                        </div>
                                        <div class="contact-info">
                                            <h4>求职意向: </h4>
                                            <p>${resume.intention }</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="my-contact">
                                        <div class="contact-icon">
                                            <span class=" icon-wallet"></span>
                                        </div>
                                        <div class="contact-info">
                                            <h4>期望薪资: </h4>
                                            <p>￥${resume.salary }</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="my-contact">
                                        <div class="contact-icon">
                                            <span class=" icon-chat"></span>
                                        </div>
                                        <div class="contact-info">
                                            <h4>简历状态: </h4>
                                            <c:if test="${STATE.isView == 1 && STATE.isInterest == 0 && STATE.isInterviewBefore == 0 && STATE.isInterviewAfter == 0}"><p>已查看</p></c:if>
                                            <c:if test="${STATE.isView == 1&& STATE.isInterest == 1 }"><p>感兴趣</p></c:if>
                                            <c:if test="${STATE.isView == 1&& STATE.isInterviewBefore == 1}"><p>待面试</p></c:if>
                                            <c:if test="${STATE.isView == 1&& STATE.isInterviewAfter == 1}"><p>已面试</p></c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="resume-box">
                            <div class="heading-inner">
                                <p class="title light-grey">个人简介</p>
                            </div>
                            <p class="about-me">${resume.introduction }</p>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="resume-box">
                            <div class="heading-inner">
                                <p class="title light-grey">简历附件</p>
                            </div>
                            <p class="about-me">
                                <c:if test="${not empty resume.rFile }">
                                    <img src="${pageContext.request.contextPath }/files/${resume.rFile}" >
                                </c:if>
                                <c:if test="${empty resume.rFile }">无附件</c:if>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="heading-inner">
                            <p class="title light-grey">个人技能统计</p>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 92%;">
                                        <span class="sr-only">92% Complete</span>
                                    </div>
                                    <span class="progress-type">HTML / HTML5</span>
                                    <span class="progress-completed">92%</span>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="10" style="width: 90%">
                                        <span class="sr-only">38% Complete (success)</span>
                                    </div>
                                    <span class="progress-type">PHP / MySQL</span>
                                    <span class="progress-completed">90%</span>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete (danger)</span>
                                    </div>
                                    <span class="progress-type">CSS / CSS3</span>
                                    <span class="progress-completed">80%</span>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        <span class="sr-only">20% Complete (info)</span>
                                    </div>
                                    <span class="progress-type">Java</span>
                                    <span class="progress-completed">20%</span>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                                        <span class="sr-only">85% Complete (warning)</span>
                                    </div>
                                    <span class="progress-type">JavaScript / jQuery</span>
                                    <span class="progress-completed">85%</span>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete (danger)</span>
                                    </div>
                                    <span class="progress-type">CSS / CSS3</span>
                                    <span class="progress-completed">80%</span>
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

    <!-- TOASTER JS -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/toastr.min.js"></script>

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
<%--<title>简历信息</title>--%>
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/viewResume_style.css"/>--%>
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/foot.css"/>--%>
<%--</head>--%>
<%--<body>--%>
	<%--<div id="BodyBg">--%>
        <%--<img src="${pageContext.request.contextPath }/photo/bg1.jpg" class="stretch" alt="" />--%>
    <%--</div>--%>
      <%--<header>--%>
        <%--<c:if test="${empty CUR_USER }">--%>
            <%--&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/user/reg">注册</a>&nbsp;/&nbsp;<a href="${pageContext.request.contextPath }/user/login">登录</a>--%>
        <%--</c:if>--%>
        <%--<c:if test="${CUR_USER != null }">--%>
        <%--&nbsp;<span class="username">您好 ${CUR_USER.username }，</span>--%>
            <%--<a href="${pageContext.request.contextPath }/user/quitComUser">退出</a>--%>
        <%--</c:if>--%>
        <%--<div class="myInfo">--%>
            <%--<a href="${pageContext.request.contextPath }/firm/firmIndex">首页</a>&nbsp;&nbsp;--%>
            <%--<a href="${pageContext.request.contextPath }/firm/myCenter">个人中心</a>&nbsp;&nbsp;--%>
            <%--<a href="${pageContext.request.contextPath }/firm/myFirm">公司信息</a>&nbsp;&nbsp;--%>
        <%--</div>--%>
    <%--</header>--%>
   	  <%--<fieldset>--%>
        <%--<legend>简历信息</legend><br>--%>
        <%--<div class="edit">--%>
        <%--<span>姓名:  </span><span>${resume.realName }</span><br/><br/>--%>
        <%--<span>性别:   </span><span>${resume.gender == "male"?"男":"女"}</span><br/><br/>--%>
        <%--<span>年龄:  </span><span>${resume.age }</span><br/><br/>--%>
        <%--<span>电话:  </span><span>${resume.phone }</span><br/><br/>--%>
        <%--<span>学历:  </span><span>${resume.education }</span><br/><br/>--%>
        <%--<span>工作经验:  </span><span>${resume.experience }</span><br/><br/>--%>
        <%--<span>求职意向:  </span><span>${resume.intention }</span><br/><br/>--%>
        <%--<span>期望工资:  </span><span>${resume.salary }</span><br/><br/>--%>
        <%--<span>个人简介:  </span><span>${resume.introduction }</span><br/><br/>--%>
        <%--<span>简历附件:  </span> --%>
        <%--<c:if test="${resume.rFile }">--%>
        <%--<td><img src="${pageContext.request.contextPath }/files/${resume.rFile}" ></td>--%>
        <%--</c:if>--%>
        <%--<c:if test="${empty resume.rFile }"><td>无附件</td></c:if><br/><br/>--%>
        <%--<span>状态:  </span><br/>--%>
     <%----%>
        <%--<c:if test="${STATE.isView == 1 && STATE.isInterest == 0 && STATE.isInterviewBefore == 0 && STATE.isInterviewAfter == 0}"><span>已查看</span></c:if>--%>
        <%--<c:if test="${STATE.isView == 1&& STATE.isInterest == 1 }"><span>感兴趣</span></c:if>--%>
        <%--<c:if test="${STATE.isView == 1&& STATE.isInterviewBefore == 1}"><span>可面试</span></c:if>--%>
        <%--<c:if test="${STATE.isView == 1&& STATE.isInterviewAfter == 1}"><span>已面试</span></c:if>--%>
        <%--<br/><br/>--%>
        <%--<span>状态操作：</span><br/>--%>
        <%--<a href="${pageContext.request.contextPath }/job/isInterest?rid=${resume.rid }&jid=${JID}">感兴趣</a>&nbsp;--%>
        <%--<a href="${pageContext.request.contextPath }/job/isInterviewBefore?rid=${resume.rid }&jid=${JID}">可面试</a>&nbsp;--%>
        <%--<a href="${pageContext.request.contextPath }/job/isInterviewAfter?rid=${resume.rid }&jid=${JID}">已面试</a>--%>
        <%--</div>--%>
      <%--</fieldset>--%>
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