<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<title>
公司简介 - 梦之航</title>
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
	.intro_dd{ font-size:14px; font-weight:bold; background:url("http://img4.ddimg.cn/00012/dang/about_dd.gif") no-repeat scroll 10px 25px transparent;height:56px;padding-left:10px;width:100px;padding-top:1px;}
	.title ul{height:52px; padding-top:20px; background:url(http://img4.ddimg.cn/00012/dang/content_line.gif) no-repeat 0 bottom;}
	.title ul li{ float:left;}
	.bg_left{ margin-left:17px;}
	.about_content .content{clear:left; border-left:1px solid #dddddd; border-right:1px solid #dddddd;padding-bottom:80px; width:784px;}
	
	.content p{line-height:20px; padding-left:65px;width:643px; padding-top:35px;}
	p.first{padding-right:200px; padding-top:46px; width:460px;}
	p.last{padding-bottom:120px;}
	
	.about_nav ul li a:hover{color:#ff6600;}
	.about_content img {display:block;}
	a{ color:#878787;}
	
	
	ul.first{padding-top:36px;}
	ul.last{padding-bottom:120px;}
	.content ul.mission_list li{line-height:25px;}
	
	.mission_list{ padding-left:88px; width:614px;}
	.mission_list li{ background:url("http://img4.ddimg.cn/00012/dang/ico_dot.gif") no-repeat scroll 0 5px transparent;line-height:20px;padding-left:10px;}
	.intro_title{font-size:14px; font-weight:bold; height:56px;padding-left:10px;width:100px;}
<!--
body,td,th {
	font-family: 宋体;
	font-size: 12px;
}
-->
</style>
</head>
<body>
<DIV class=layout_main>
<DIV class=about_head><IMG style="WIDTH: 960px; MARGIN: 0px auto; DISPLAY: block" src="${pageContext.request.contextPath }/img/about_top.png"> </DIV>
<DIV class=about_nav>
<H4 class=dd_brief></H4>
<UL class=company>
<LI><A href="${pageContext.request.contextPath  }/user/backIndex">招聘首页</A></LI>
<LI class=black><A href="javascript:void(0);">梦之航简介</A> 
<LI><A href="${pageContext.request.contextPath  }/about/fazhan">发展历程</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/shiming">公司使命</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/jingying">经营模式</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/zeren">社会责任</A></LI></UL>
<H4 class=dd_culture></H4>
<UL class=culture>
<LI><A href="${pageContext.request.contextPath  }/about/wenhua">企业文化</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/duihua">对话梦之航</A></LI>
<LI><A href="${pageContext.request.contextPath  }/about/chengnuo">服务承诺</A> </LI></UL></DIV>
<DIV class=about_content><IMG src="${pageContext.request.contextPath }/img/about_line.gif">
<DIV class=title>
<UL>
<LI class=bg_left><IMG src="${pageContext.request.contextPath }/img/about_left.gif"> </LI>
<LI class="intro_title intro_dd">梦之航简介 </LI></UL></DIV>
<DIV class=content>
<P class=first>&nbsp;&nbsp;&nbsp;&nbsp;
梦之航，是一家专为拥有3至10年工作经验的资深互联网从业者，提供工作机会的招聘网站。梦之航专注于在为求职者提供更人性化、专业化服务的同时，降低企业端寻觅良才的时间和成本。梦之航致力于帮助互联网人士做出更好的职业选择，让求职者每一次职业选择变的更加明智。

在梦之航里，每一次投递都会收到企业的明确回应，最快回应时间仅为1分钟。梦之航的”24小时极速入职”，彻底颠覆了“投简历石沉大海”的国民痛点。由于精准的职位匹配，求职者平均每8次投递就会收到一次优质面试机会。
</P>
<P class=second>&nbsp;&nbsp;&nbsp;&nbsp;
梦之航于2013年7月20日上线。截止2014年7月1日已有超过20000家互联网公司入驻，这其中既有百度、腾讯、阿里巴巴、新浪、优酷、乐视网等成熟稳重的大企业，也有去哪儿、聚美优品、锤子科技、小米、豌豆荚、等高速成长的行业新秀。企业覆盖领域包括互联网、移动互联网、电子商务、游戏、O2O、大数据、云计算、社交网络、互联网金融、在线教育、在线旅游、等25个互联网细分市场。[2]

梦之航颠覆了传统招聘网站以企业方为服务对象的运营模式，转而将求职者作为核心服务对象。梦之航的每一个环节设计都是为了无限改善求职者的使用体验。

对公司方而言，梦之航既是可靠的高质量人才池，也是一个可以展现公司创始团队、公司产品、融资阶段的平台。这些信息，有助于求职者快速了解公司，加速双方的相互碰撞。

2016年3月23日，梦之航正式对外宣布获2.2亿元人民币C轮融资，由弘道资本领投（天使投资方），启明创投、荣超投资等机构跟投。据梦之航方面表示，本次融资将主要用于产品和技术研发，尝试更多元人力资源服务。[3]

2017年9月22日，梦之航宣布获得1.2亿美元战略投资，投资方为人力资源公司前程无忧，泰合资本担任独家财务顾问。梦之航方面表示，该轮引入战略投资后，梦之航仍完全保持团队和业务的独立，并将借助前程无忧客户资源加速业务和收入发展，进化为人力资源综合服务平台。[4]
</P>
</DIV><IMG src="${pageContext.request.contextPath }/img/about_line.gif"> </DIV></DIV><BR style="CLEAR: both">
</body>
</html>