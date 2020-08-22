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
    <title>梦之航 - 编辑职位信息</title>
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

    <!-- FOR THIS PAGE ONLY -->
    <link href="${pageContext.request.contextPath }/basic/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/jquery.tagsinput.min.css">

    <!-- FONT AWESOME -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/basic/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/basic/css/et-line-fonts.css" type="text/css">

    <!-- Google Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">

    <!-- Custom Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/center_style.css"/>

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
                    <h3>编辑职位信息</h3>
                </div>
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath }/firm/firmIndex">主页</a> </li>
                            <li><a href="${pageContext.request.contextPath }/firm/jobsList">发布职位列表</a> </li>
                            <li class="active">编辑职位信息</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="post-job">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="box-panel">
                        <div class="Heading-title black">
                            <h3>编辑职位信息</h3>
                            <p>精诚所至，金石为开。</p>
                        </div>
                        <form class="row" action="${pageContext.request.contextPath }/job/updateJobDo" method="post">
                            <input type="hidden" name="jid" value="${CUR_JOB.jid}"/>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>职位名称：</label>
                                    <input type="text" placeholder="" class="form-control" name="jobName" value="${CUR_JOB.jobName }">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>职位薪水：</label>
                                    <input type="text" placeholder="" class="form-control" name="pay" value="${CUR_JOB.pay }">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>工作经验：</label>
                                    <select class="questions-category form-control" name="reqExperience">
                                        <option value="不要求" ${CUR_JOB.reqExperience == "不要求"?"selected='selected'":""}>不要求</option>
                                        <option value="应届毕业生" ${CUR_JOB.reqExperience == "应届毕业生"?"selected='selected'":""}>应届毕业生</option>
                                        <option value="3年及以下" ${CUR_JOB.reqExperience == "3年及以下"?"selected='selected'":""}>3年及以下</option>
                                        <option value="3-5年" ${CUR_JOB.reqExperience == "3-5年"?"selected='selected'":""}>3-5年</option>
                                        <option value="5-10年" ${CUR_JOB.reqExperience == "5-10年"?"selected='selected'":""}>5-10年</option>
                                        <option value="10年以上" ${CUR_JOB.reqExperience == "10年以上"?"selected='selected'":""}>10年以上</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>学历：</label>
                                    <select class="questions-category form-control" name="reqEducation">
                                        <option value="不要求" ${CUR_JOB.reqEducation == "10年以上"?"selected='selected'":""}>不要求</option>
                                        <option value="小学" ${CUR_JOB.reqEducation == "小学"?"selected='selected'":""}>小学</option>
                                        <option value="初中" ${CUR_JOB.reqEducation == "初中"?"selected='selected'":""}>初中</option>
                                        <option value="高中" ${CUR_JOB.reqEducation == "高中"?"selected='selected'":""}>高中</option>
                                        <option value="大专" ${CUR_JOB.reqEducation == "大专"?"selected='selected'":""}>大专</option>
                                        <option value="本科" ${CUR_JOB.reqEducation == "本科"?"selected='selected'":""}>本科</option>
                                        <option value="硕士" ${CUR_JOB.reqEducation == "硕士"?"selected='selected'":""}>硕士</option>
                                        <option value="博士" ${CUR_JOB.reqEducation == "博士"?"selected='selected'":""}>博士</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label>职位诱惑：</label>
                                    <input type="text" id="tags" value="${CUR_JOB.attract }" class="form-control" data-role="tagsinput" name="attract">
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label>职位描述：</label>
                                    <textarea name="description" id="ckeditor">${CUR_JOB.description }</textarea>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <button class="btn btn-default pull-right">编辑职位 <i class="fa fa-angle-right"></i></button>
                            </div>
                        </form>
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
    <!-- FOR THIS PAGE ONLY -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/jquery.tagsinput.min.js"></script>
    <script type="text/javascript">
        $(".questions-category").select2({
            placeholder: "Select Post Category",
            allowClear: true,
            maximumSelectionLength: 3,
            /*width: "50%",*/
        });
        $('#tags').tagsInput({
            width: 'auto'
        });
    </script>

    <!-- CK-EDITOR -->
    <script src="http://cdn.ckeditor.com/4.5.10/standard/ckeditor.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('ckeditor');
    </script>
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
    <%--<title>修改公司信息</title>--%>
     <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/job_style.css"/>--%>
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
    <%--<form action="${pageContext.request.contextPath }/job/updateJobDo" method="post">--%>
    <%--<fieldset>--%>
        <%--<legend>修改职位</legend><br>--%>
        <%--<div class="edit">--%>
        <%--<span><span style="color:red">*</span>职位名称：</span><input type="text" name="jobName" value="${CUR_JOB.jobName }"/><br/><br>--%>
        <%--<span><span style="color:red">*</span>职位薪水：</span><input type="text" name="pay" value="${CUR_JOB.pay }"/><br/><br>--%>
        <%--<span><span style="color:red">*</span>工作经验：</span>--%>
        <%--<select name="reqExperience">--%>
            <%--<option value="不要求" ${CUR_JOB.reqExperience == "不要求"?"selected='selected'":""}>不要求</option>--%>
            <%--<option value="应届毕业生" ${CUR_JOB.reqExperience == "应届毕业生"?"selected='selected'":""}>应届毕业生</option>--%>
            <%--<option value="3年及以下" ${CUR_JOB.reqExperience == "3年及以下"?"selected='selected'":""}>3年及以下</option>--%>
            <%--<option value="3-5年" ${CUR_JOB.reqExperience == "3-5年"?"selected='selected'":""}>3-5年</option>--%>
            <%--<option value="5-10年" ${CUR_JOB.reqExperience == "5-10年"?"selected='selected'":""}>5-10年</option>--%>
            <%--<option value="10年以上" ${CUR_JOB.reqExperience == "10年以上"?"selected='selected'":""}>10年以上</option>--%>
        <%--</select><br/><br>--%>
        <%--<span><span style="color:red">*</span>学历：</span>--%>
        <%--<select name="reqEducation">--%>
            <%--<option value="不要求" ${CUR_JOB.reqEducation == "10年以上"?"selected='selected'":""}>不要求</option>--%>
            <%--<option value="小学" ${CUR_JOB.reqEducation == "小学"?"selected='selected'":""}>小学</option>--%>
            <%--<option value="初中" ${CUR_JOB.reqEducation == "初中"?"selected='selected'":""}>初中</option>--%>
            <%--<option value="高中" ${CUR_JOB.reqEducation == "高中"?"selected='selected'":""}>高中</option>--%>
            <%--<option value="大专" ${CUR_JOB.reqEducation == "大专"?"selected='selected'":""}>大专</option>--%>
            <%--<option value="本科" ${CUR_JOB.reqEducation == "本科"?"selected='selected'":""}>本科</option>--%>
            <%--<option value="硕士" ${CUR_JOB.reqEducation == "硕士"?"selected='selected'":""}>硕士</option>--%>
            <%--<option value="博士" ${CUR_JOB.reqEducation == "博士"?"selected='selected'":""}>博士</option>--%>
        <%--</select><br/><br>--%>
        <%--<span><span style="color:red">*</span>职位诱惑：</span><br/><textarea name="attract" cols="30" rows="5" >${CUR_JOB.attract }</textarea><br/><br>--%>
        <%--<span><span style="color:red">*</span>职位描述：</span><br/><textarea name="description" cols="30" rows="10" >${CUR_JOB.description }</textarea><br/><br>--%>
        <%--<input type="hidden" name="jid" value="${CUR_JOB.jid}"/>--%>
        <%--<input type="submit"  class="submit" value="编辑"/>--%>
        <%--</div>--%>
        <%--</fieldset>--%>
    <%--</form>--%>
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