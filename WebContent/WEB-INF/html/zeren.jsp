<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<title>
社会责任 - 梦之航</title>
<style type="text/css">
/*reset*/
	body,h1,h2,h3,h4,h5,h6,p,ul,li{margin:0;padding:0;}
	h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal;}
	ul,li{list-style:none;}
	img{border:none;}
	.clear{clear:both;font-size:0;height:0;line-height:0;overflow:hidden;}
	.clearfix:after{clear:both;content:" ";display:block;font-size:0;height:0;visibility:hidden;}
	.clearfix{zoom:1;}

	/* 共用  */
	body{ font-family:宋体,Arial,Helvetica,sans-serif; font-size:12px; color:#404040}
	a{color:#1a66b3;text-decoration:none; }
	a:hover{color:#1a66b3;text-decoration:underline;}

	/*页面*/
	.layout_main{margin:0 auto; width:960px; color:#878787;text-align:left;}
	.about_head{margin:2px 0 5px; padding:2px 0 5px;}
	.about_nav {float:left;width:174px;}
	.about_nav h4{border-bottom:1px solid #EAEAEA;font-size:0;height:31px;lin-height:0;overflow:hidden;width:134px;}
	.about_nav ul{ margin-left:35px;}
	.about_nav ul li{background: url(http://img4.ddimg.cn/00030/job/ico_dot.gif) no-repeat;margin-top:13px;padding:0 0 0 17px;}
	.about_nav ul li a { color:#878787;}
	.about_nav ul li a:hover {color:#f60;}
	.about_nav ul li.black a,.about_nav ul li.black a:hover {color:#404040;cursor:default;font-weight:bold;text-decoration:none;}
	
	.about_nav .dd_brief {background:url(http://img4.ddimg.cn/00038/job/about_brief.gif) no-repeat 0 0;margin:20px;margin-top:0;}
	.about_nav .dd_culture{background:url(http://img4.ddimg.cn/00038/job/about_culture.gif) no-repeat 0 0;border-top:1px solid #EAEAEA;margin:20px;}

	
	.text_last{ padding-bottom:8px;}
	.about_content{float:right;}
	.about_content .title{ border-left:1px solid #dddddd; border-right:1px solid #dddddd; width:784px;margin:0;padding:0;height:80px;}
	.intro_dd{ font-size:14px; font-weight:bold; background:url("http://img4.ddimg.cn/00012/dang/about_dd.gif") no-repeat scroll 10px 22px transparent;height:56px;padding-left:10px;width:100px;}
	.title ul{height:52px; padding-top:20px; background:url(http://img4.ddimg.cn/00012/dang/content_line.gif) no-repeat 0 bottom;}
	.title ul li{ float:left;}
	.bg_left{ margin-left:17px;}
	.about_content .content{clear:left; border-left:1px solid #dddddd; border-right:1px solid #dddddd; width:784px;}
	
	.content p{line-height:20px; padding-left:65px;width:643px; padding-top:36px;}
	p.first{padding-right:200px; background:url("http://img4.ddimg.cn/00012/dang/logo_dd.gif") no-repeat scroll 549px 30px transparent;width:483px;}
	p.last{padding-bottom:120px;}
	
	.about_nav ul li a:hover{color:#ff6600;}
	.about_content img {display:block;}
	a{ color:#878787;}
	.black{ color:#404040;}
	
	ul.first{padding-top:36px;}
	ul.last{padding-bottom:120px;}
	.content ul.mission_list li{line-height:25px;}
	
	.mission_list{ padding-left:88px; width:614px;}
	.mission_list li{ background:url("http://img4.ddimg.cn/00012/dang/ico_dot.gif") no-repeat scroll 0 5px transparent;line-height:20px;padding-left:10px;}
	.intro_title{font-size:14px; font-weight:bold; height:56px;padding-left:10px;width:100px;}
	.intro_responsibility {background:url(http://img4.ddimg.cn/00030/job/about_resp_1.gif) no-repeat scroll 10px 25px transparent;padding-top:1px;}
	
	.pb_activities {margin-top:30px;overflow:hidden;padding-left:65px;width:643px;}
	.pb_title {color:#878787;font-weight:bold;font-size:13px;line-height:20px;}
	.pb_activities ul {margin:12px 0 50px;overflow:hidden;width:643px;}
	.pb_activities li {background: url("http://img4.ddimg.cn/00012/dang/ico_dot.gif") no-repeat scroll 7px 5px transparent;height:18px;overflow:hidden;padding:4px 0 2px 18px;vertical-align:top;width:625px;}
	.pb_activities li a {color:#878787;display:inline;float:left;text-decoration:none;}
	.pb_activities li a:hover {color:#f60;text-decoration:underline;}
	.pb_activities li span  {color:#878787;display:inline;float:right;font-family:Arial,"b8bf53";}
	
	.pb_activities li .disabled,.pb_activities li a.disabled:hover {color:#878787;cursor:default;text-decoration:none;}

</style>
</head>
<body>
<DIV class=layout_main>
<DIV class=about_head><IMG style="WIDTH: 960px; MARGIN: 0px auto; DISPLAY: block" src="${pageContext.request.contextPath }/img/about_top.png"> </DIV>
<DIV class=about_nav>
<H4 class=dd_brief></H4>
<UL class=company>
<LI><A href="${pageContext.request.contextPath  }/user/backIndex">招聘首页</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/jianjie">梦之航简介</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/fazhan">发展历程</A></LI>
<LI><A href="vshiming.html">公司使命</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/jingying">经营模式</A></LI>
<LI class=black><A href="javascript:void(0);">社会责任</A></LI></UL>
<H4 class=dd_culture></H4>
<UL class=culture>
<LI><A href="${pageContext.request.contextPath  }/about/wenhua">企业文化</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/duihua">对话梦之航</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/chengnuo">服务承诺</A> </LI></UL></DIV>
<DIV class=about_content><IMG src="${pageContext.request.contextPath }/img/about_line.gif">
<DIV class=title>
<UL>
<LI class=bg_left><IMG src="${pageContext.request.contextPath }/img/about_left.gif"> </LI>
<LI class="intro_title intro_responsibility">社会责任 </LI></UL></DIV>
<DIV class=content>
<P>&nbsp;&nbsp;&nbsp;&nbsp;梦之航一直致力于在企业创造利润、对股东承担法律责任的同时，还承担对员工、消费者、社区和环境的责任。
    企业的社会责任要求企业必须超越把利润作为唯一目标的传统理念，强调要在生产过程中对人的价值的关注，强调对消费者、对环境、对
    社会的贡献，为此我们开展一系列公益活动，回报社会。
</P>
<DIV class=pb_activities>
<DIV class=pb_title>与社会共成长</DIV>
<UL>
<LI><A class=disabled href="javascript:void(0);">苹果雪域计划</A><SPAN>2010.11</SPAN>
<DIV class=disabled></DIV></LI>
<LI><A class=disabled href="">当当网太阳村慰问活动</A><SPAN>2010.08</SPAN>
<DIV class=disabled></DIV></LI>
<LI><A class=disabled href="">当当网加盟“绿书签”行动</A><SPAN>2010.05</SPAN>
</LI>
<LI><A class=disabled href="javascript:void(0);">关注灾后心灵重建 当当网推出“读者捐书“活动</A><SPAN>2008.06</SPAN>
<DIV class=clear></DIV></LI>
<LI><A class=disabled href="javascript:void(0);">当当网义卖平台上线 助力四川灾区重建</A><SPAN>2008.06</SPAN>
<DIV class=clear></DIV></LI>
<LI><A class=disabled href="javascript:void(0);">集善嘉年华</A><SPAN>2001.10 - 今</SPAN>
<DIV class=clear></DIV></LI></UL></DIV></DIV><IMG src="${pageContext.request.contextPath }/img/about_line.gif"> </DIV></DIV><BR style="CLEAR: both">
</body>
</html>