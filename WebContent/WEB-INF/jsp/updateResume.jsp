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
    <title>梦之航 - 编辑简历</title>
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
                            <li><a href="${pageContext.request.contextPath }/resume/Resume"><i class="fa fa-user"></i> 简历信息</a></li>
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
                    <h3>编辑简历</h3>
                </div>
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="#">主页</a> </li>
                            <li class="active">编辑简历</li>
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
                                    <li class="active">
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
                        <div class="heading-inner first-heading">
                            <p class="title">编辑简历</p>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                            <div class="profile-edit row">
                                <form action="${pageContext.request.contextPath }/resume/updateResumeDo" method="post" enctype="multipart/form-data">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>姓名： <span class="required">*</span></label>
                                            <input type="text" placeholder="" class="form-control" name="realName" value="${resume.realName}">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>年龄： <span class="required">*</span></label>
                                            <input type="text" placeholder="" class="form-control" name="age" maxlength="3" value="${resume.age}">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>电话： <span class="required">*</span></label>
                                            <input type="text" placeholder="" class="form-control" name="phone" maxlength="11" value="${resume.phone}">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>期望薪资： <span class="required">*</span></label>
                                            <input type="text" placeholder="" class="form-control" name="salary" value="${resume.salary }">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group">
                                            <label>性别： <span class="required">*</span></label>
                                            <input type="radio" name="gender" value="male" ${resume.gender == "male"?"checked='checked'":""}>男
                                            <input type="radio" name="gender" value="female" ${resume.gender == "female"?"checked='checked'":""}>女
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group">
                                            <label>学历： <span class="required">*</span></label>
                                            <select name="education">
                                                <option value="小学" ${resume.education == "小学"?"selected='selected'":""}>小学</option>
                                                <option value="初中" ${resume.education == "初中"?"selected='selected'":""}>初中</option>
                                                <option value="高中" ${resume.education == "高中"?"selected='selected'":""}>高中</option>
                                                <option value="大专" ${resume.education == "大专"?"selected='selected'":""}>大专</option>
                                                <option value="本科" ${resume.education == "本科"?"selected='selected'":""}>本科</option>
                                                <option value="硕士" ${resume.education == "硕士"?"selected='selected'":""}>硕士</option>
                                                <option value="博士" ${resume.education == "博士"?"selected='selected'":""}>博士</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group">
                                            <label>工作经验： <span class="required">*</span></label>
                                            <select name="experience">
                                                <option value="应届毕业生" ${resume.experience == "应届毕业生"?"selected='selected'":""}>应届毕业生</option>
                                                <option value="3年及以下" ${resume.experience == "3年及以下"?"selected='selected'":""}>3年及以下</option>
                                                <option value="3-5年" ${resume.experience == "3-5年"?"selected='selected'":""}>3-5年</option>
                                                <option value="5-10年" ${resume.experience == "5-10年"?"selected='selected'":""}>5-10年</option>
                                                <option value="10年以上" ${resume.experience == "10年以上"?"selected='selected'":""}>10年以上</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label>求职意向： <span class="required">*</span></label>
                                            <input type="text" placeholder="" class="form-control" name="intention" value="${resume.intention }">
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label>个人简介： <span class="required">*</span></label>
                                            <textarea cols="6" rows="8" placeholder="" class="form-control" name="introduction">${resume.introduction }</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-8 col-sm-12">
                                        <div class="input-group image-preview form-group">
                                            <label>简历附件: <span class="required">*</span></label>
                                            <input type="text" placeholder="上传简历附件" class="form-control image-preview-filename" disabled="disabled">
                                            <span class="input-group-btn">
                                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                        <span class="glyphicon glyphicon-remove"></span> Clear
                                            </button>
                                            <div class="btn btn-default image-preview-input">
                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                <span class="image-preview-input-title">Browse</span>
                                                <input type="file" accept="file_extension" name="rFile" />
                                            </div>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <button class="btn btn-default pull-right"> 保存简历 <i class="fa fa-angle-right"></i></button>
                                    </div>
                                </form>
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
</div>
</body>
</html>