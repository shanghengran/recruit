<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<title>
发展历程 - 梦之航</title>
<style type="text/css">
/*公用部分*/
*{margin:0;padding:0}
body{ font-family:宋体,Arial,Helvetica,sans-serif; font-size:12px; color:#404040}
a{ text-decoration:none; color:#1a66b3}
a:hover{text-decoration:underline;color:#1a66b3}
img{border:0}
* ul,* ol,* li {list-style:none}
h1,h2,h3,h4,h5,h6{font-size:12px;font-weight:normal}
.dot{ letter-spacing:-3px}
.clear{ clear:both;line-height:0px;height:0px;font-size:0px}
.del{text-decoration:line-through}

/*全网文字公用*/
.s12{ font-size:12px;}
.s14{ font-size:14px;}
.b{ font-weight:bold;}

/*全网文字颜色公用*/
.red,.red a,.red a:hover{ color:#c30;}
.gray,.gray a,.gray a:hover{ color:#878787;}
.white,.white a,.white a:hover{ color:#fff;}
.black,.black a,.black a:hover{ color:#404040;}
.blue,.blue a,.blue a:hover{ color:#1a66b3;}
.orange,.orange a,.orange a:hover{ color:#ff7100;}

.red_9d,.red_9d a,.red_9d a:hover{ color:#9d6363;}
.red_85,.red_85 a,.red_85 a:hover{ color:#853200;}
.gray_6,.gray_6 a,.gray_6 a:hover{color:#666;}
.gray_40,.gray_40 a,.gray_40 a:hover{ color:#404040;}
.gray_9e,.gray_9e a,.gray_9e a:hover{ color:#9e9e9e;}
.gray_7f,.gray_7f a,.gray_7f a:hover{ color:#7f7f7f;}

/*about 页面样式*/
.layout_main{margin:0 auto; width:960px; color:#878787;text-align:left;}
.about_head{margin:2px 0 5px; padding:2px 0 5px;}
.about_nav{ float:left;height:440px; width:174px;}
.about_nav h4{ border-bottom:1px solid #EAEAEA;font-size:0;height:31px;lin-height:0;overflow:hidden;width:134px;}
.about_nav ul{ margin-left:35px;}
.about_nav ul li{ margin-top:13px;padding:0 0 0 17px; background: url("http://img4.ddimg.cn/00012/dang/ico_dot.gif") no-repeat;}
.company{}

h4.dd_brief {background:url(http://img4.ddimg.cn/00038/job/about_brief.gif) no-repeat 0 0;margin:20px;margin-top:0;}
h4.dd_culture{background:url(http://img4.ddimg.cn/00038/job/about_culture.gif) no-repeat 0 0;border-top:1px solid #EAEAEA;margin:20px;}

.company li{}
.culture{}
.culture li{}
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
.black{ font-weight:bold;}

ul.first{padding-top:36px;}
ul.last{padding-bottom:120px;}
.content ul.mission_list li{line-height:25px;}

.mission_list{ padding-left:88px; width:614px;}
.mission_list li{ background:url("http://img4.ddimg.cn/00012/dang/ico_dot.gif") no-repeat scroll 0 5px transparent;line-height:20px;padding-left:10px;}
.intro_title{font-size:14px; font-weight:bold; height:56px;padding-left:10px;width:100px;}
.intro_history{background:url(http://img4.ddimg.cn/00012/dang/about_oh.gif) no-repeat scroll 10px 25px transparent;padding-top:1px;}
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
<LI><A href="${pageContext.request.contextPath  }/about/jianjie">梦之航简介</A></LI>
<LI class=black><A href="javascript:void(0);">发展历程</A></LI>
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
<LI class="intro_title intro_history">发展历程 </LI></UL></DIV>
<DIV class=content>
<UL class="mission_list first">
<LI>发展历程 </LI>
<LI>发展历程　 </LI>
<LI>发展历程　 </LI>
<LI>发展历程　 </LI>
<LI>发展历程　 </LI>
<LI>发展历程　 </LI>
<LI>发展历程　 </LI>
<LI>发展历程　 </LI>
<LI>发展历程　 </LI>
</UL>
</DIV><IMG src="${pageContext.request.contextPath }/img/about_line.gif"> </DIV></DIV><BR style="CLEAR: both">
</body>
</html>