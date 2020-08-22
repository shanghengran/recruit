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
    <title>梦之航 - 个人中心</title>
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
                <li class="no-bg"><a href="${pageContext.request.contextPath }/job/createJob" class="p-job"><i class="fa fa-plus-square"></i> 发布职位</a></li>
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
                    <h3>个人中心</h3>
                </div>
                <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                    <div class="bread">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath }/firm/firmIndex">主页</a> </li>
                            <li class="active">个人中心</li>
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
                                    <li class="active">
                                        <a href="${pageContext.request.contextPath }/firm/myCenter"> <i class="fa fa-user"></i> 个人中心</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-12">
                        <div class="heading-inner first-heading">
                            <p class="title">个人中心</p>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                            <div class="profile-edit row">
                                <div class="panel-heading">
                                    <!-- Tabs -->
                                    <ul class="nav panel-tabs">
                                        <li> <a href="javascript:void(0)" data-toggle="tab" onclick="blockDiv_update_photo()" style="color: #0081C6"><i class="fa fa-user"></i>&nbsp;<span class="hidden-xs hidden-sm">头像修改</span></a> </li>
                                        <li> <a href="javascript:void(0)" data-toggle="tab" onclick="blockDiv_update_password()" style="color: #0081C6"><i class="fa fa-gear"></i>&nbsp;<span class="hidden-xs hidden-sm">密码修改</span></a> </li>
                                    </ul>
                                </div>
                            </div>
                                <div id="update_photo">
                                    <form class="ph" action="${pageContext.request.contextPath }/user/update_photo" method="post" enctype="multipart/form-data">
                                        <br/>
                                        <div class="col-md-4 col-sm-12">
                                            <div class="form-group">
                                                <label>当前头像： </label>
                                                <img class="Pimg" src="${pageContext.request.contextPath }/photo/${CUR_USER.photo }" />
                                            </div>
                                        </div>
                                        <div class="col-md-8 col-sm-12" style="margin-top: 10px">
                                            <div class="input-group image-preview form-group">
                                                <input type="text" placeholder="修改头像" class="form-control image-preview-filename" disabled="disabled">
                                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                        <span class="glyphicon glyphicon-remove"></span> Clear
                                            </button>
                                            <div class="btn btn-default image-preview-input">
                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                <span class="image-preview-input-title">Browse</span>
                                                <input type="file" accept="file_extension" id="photo" name="photo" />
                                            </div>
                                            </span>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-sm-12">
                                            <button class="btn btn-default pull-right"> 保存头像 <i class="fa fa-angle-right"></i></button>
                                        </div>
                                    </form>
                                </div>
                                <div id="update_password">
                                    <form class="pwd" action="${pageContext.request.contextPath }/user/update_password" method="post" >
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>原密码： </label>
                                                <input type="password"  id="oldPassword" name="oldPassword" class="form-control"/><span id="checkPassword"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>新密码： </label>
                                                <input type="password"  id="newPassword" name="newPassword" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-sm-12">
                                            <button class="btn btn-default pull-right"> 修改密码 <i class="fa fa-angle-right"></i></button>
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
    <script src="${pageContext.request.contextPath }/js/center.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".ph").submit( function () {
                if($.trim($("#photo").val()).length==0){
                    alert("头像选择不能为空！");
                    return false;
                }else{
                    alert("头像修改成功！");
                    return true;
                }
            } );
            $("#oldPassword").blur( function () {
                var str1 = "${CUR_USER.username}";
                var str2 = $("#oldPassword").val();
                $.getJSON("/recruit/user/checkPassword",{username:str1,oldPassword:str2},function(data){
                    var span = document.getElementById("checkPassword");
                    if(data.state == 1){
                        span.style.color="green";
                    }else{
                        span.style.color="red";
                    }
                    span.innerText = data.msg;
                });
            } );
            $(".pwd").submit( function () {
                if($.trim($("#oldPassword").val()).length==0 || $.trim($("#newPassword").val()).length==0){
                    alert("密码不能为空！");
                    return false;
                }else{
                    alert("密码修改成功！");
                    return true;
                }
            } );
        })
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
    <%--<title>个人中心</title>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/center_style.css"/>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath }/css/foot.css"/>--%>
    <%--<script src="${pageContext.request.contextPath }/js/center.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script>--%>
    <%--<script type="text/javascript">--%>
		<%--$(function(){--%>
			<%--$(".ph").submit( function () {--%>
				<%--if($.trim($("#photo").val()).length==0){--%>
				  <%--alert("头像选择不能为空！");--%>
				  <%--return false;--%>
				<%--}else{--%>
					<%--alert("头像修改成功！");--%>
					  <%--return true;--%>
				<%--}--%>
				<%--} );--%>
			<%--$("#oldPassword").blur( function () {--%>
				<%--var str1 = "${CUR_USER.username}";--%>
				<%--var str2 = $("#oldPassword").val();--%>
				<%--$.getJSON("/recruit/user/checkPassword",{username:str1,oldPassword:str2},function(data){--%>
					<%--var span = document.getElementById("checkPassword");--%>
					<%--if(data.state == 1){--%>
						<%--span.style.color="green";--%>
					<%--}else{--%>
						<%--span.style.color="red";--%>
					<%--}--%>
					<%--span.innerText = data.msg;--%>
				<%--}); --%>
				<%--} );--%>
			<%--$(".pwd").submit( function () {--%>
				<%--if($.trim($("#oldPassword").val()).length==0 || $.trim($("#newPassword").val()).length==0){--%>
				  <%--alert("密码不能为空！");--%>
				  <%--return false;--%>
				<%--}else{--%>
					<%--alert("密码修改成功！");--%>
					  <%--return true;--%>
				<%--}--%>
				<%--} );--%>
		<%--})    --%>
    <%--</script>--%>
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
        <%--<legend>个人中心</legend><br>--%>
    	<%--<div class="info">--%>
    	<%--<img class="Pimg" src="${pageContext.request.contextPath }/photo/${CUR_USER.photo }" /><br/>--%>
    	<%--<span>${CUR_USER.username}</span><br/>--%>
	    <%--</div>--%>
	    <%--<br/><br/>--%>
	    <%--<aside>--%>
	    	<%--<input type="button" class="block" onclick="blockDiv_update_photo()" value="个人信息"/>&nbsp;--%>
	    	<%--<input type="button" class="block" onclick="blockDiv_update_password()"value="修改密码"/><br/>--%>
	    	<%--<div id="update_photo">--%>
	            <%--<form class="ph" action="${pageContext.request.contextPath }/firm/updateMyCenter" method="post" enctype="multipart/form-data">--%>
	            	<%--<br/>--%>
	               	<%--<img  class="Pimg" src="${pageContext.request.contextPath }/photo/${CUR_USER.photo }" /><br/>--%>
	                <%--<input type="file" id="photo" name="photo"/><br/><br/>--%>
	                <%--<input type="submit" class="submit"  value="保存"/>--%>
	            <%--</form>--%>
		<%--</div>--%>
	    <%--<div id="update_password">--%>
	        <%--<form class="pwd" action="${pageContext.request.contextPath }/firm/updateMyCenter" method="post" enctype="multipart/form-data">--%>
	       		<%--<br/>--%>
	            <%--<span>原密码：</span><input type="password"  id="oldPassword" name="oldPassword"/><br/><span id="checkPassword"></span><br/>--%>
	            <%--<span>新密码：</span><input type="password"  id="newPassword" name="newPassword"/><br/><br/>--%>
	            <%--<input type="submit" class="submit" value="保存"/>--%>
	        <%--</form>--%>
	    <%--</div>--%>
	    <%--</aside>--%>
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