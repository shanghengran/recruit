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
    <title>梦之航 - 简历申请列表</title>
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
                    <h3>简历申请列表</h3>
                </div>
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath }/firm/firmIndex">主页</a>
                            </li>
                            <li class="active">简历申请列表</li>
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
                        <div class="panel">
                            <div class="dashboard-logo-sidebar">
                                <img class="img-responsive center-block" src="${pageContext.request.contextPath }/files/${CUR_FIRM.logo}" alt="Image">
                            </div>
                            <div class="text-center dashboard-logo-sidebar-title">
                                <h4>${CUR_FIRM.firmName}</h4>
                            </div>
                        </div>
                        <div class="profile-nav">
                            <div class="panel">
                                <ul class="nav nav-pills nav-stacked">
                                    <li>
                                        <a href="${pageContext.request.contextPath }/firm/firmIndex"> <i class="fa fa-user"></i> 企业详情</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/firm/myFirm"> <i class="fa fa-edit"></i> 编辑企业信息</a>
                                    </li>
                                    <li class="active">
                                        <a href="${pageContext.request.contextPath }/firm/resumesList"> <i class="fa fa-file-o"></i> 简历申请列表 </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/firm/jobsList"> <i class="fa  fa-list-ul"></i> 发布职位列表</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12">
                        <div class="heading-inner">
                            <p class="title">简历申请列表</p>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12">
                        <div class="resume-list">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead class="thead-inverse">
                                    <tr>
                                        <th>序号</th>
                                        <th>申请人姓名</th>
                                        <th>申请职位</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${FIRM_RESUMES.lists }" var="resume" varStatus="s">
                                        <tr>
                                            <td><h5>${s.count }</h5></td>
                                            <td><h5>${resume.realName }</h5></td>
                                            <td><h5>${resume.job.jobName }</h5></td>
                                            <td><button class="btn btn-custom"><a href="${pageContext.request.contextPath }/job/viewResume?rid=${resume.rid }&jid=${resume.job.jid }">立即查看</a></button></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="col-md-12 col-sm-12 col-xs-12 nopadding" style="margin-top: 10px">
                                    <div class="pagination-box clearfix">
                                        <ul class="pagination">
                                            <li>
                                                <c:if test="${FIRM_RESUMES.pageNow > 1 }">
                                                    <a href="${pageContext.request.contextPath }/firm/resumesList?pageNow=1">首页</a>
                                                    <a href="${pageContext.request.contextPath }/firm/resumesList?pageNow=${FIRM_RESUMES.pageNow - 1 }">«</a>
                                                </c:if>
                                            </li>
                                            <c:forEach begin="1" end="${FIRM_RESUMES.pageCount }" step="1" var="i">
                                                <c:if test="${FIRM_RESUMES.pageNow == i }">
                                                    <li class="active"><a href="javascript:void(0)">${i }</a></li>
                                                </c:if>
                                                <c:if test="${FIRM_RESUMES.pageNow != i }">
                                                    <li><a href="${pageContext.request.contextPath }/firm/resumesList?pageNow=${i }">${i }</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <li>
                                                <c:if test="${FIRM_RESUMES.pageNow < FIRM_RESUMES.pageCount }">
                                                    <a href="${pageContext.request.contextPath }/firm/resumesList?pageNow=${FIRM_RESUMES.pageNow + 1 }">»</a>
                                                    <a href="${pageContext.request.contextPath }/firm/resumesList?pageNow=${FIRM_RESUMES.pageCount }">尾页</a>
                                                </c:if>
                                            </li>
                                        </ul>
                                    </div>
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
