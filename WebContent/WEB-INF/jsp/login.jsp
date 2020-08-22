<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>梦之航 - 登录/注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/auth.css">
</head>

<body>
<div class="lowin">
    <a href="${pageContext.request.contextPath }/user/userIndex"><img src="${pageContext.request.contextPath }/img/web_logo_4.png" alt=""></a>
    <div class="lowin-brand">
        <img src="${pageContext.request.contextPath }/img/kodinger.jpg" alt="logo">
    </div>
    <div class="lowin-wrapper">
        <div class="lowin-box lowin-login">
            <div class="lowin-box-inner">
                <form method="post" onsubmit="loginCheck()">
                    <div class="lowin-group">
                        <label>账号(邮箱) <a href="#" class="login-back-link">登录?</a></label>
                        <input type="email" autocomplete="off" name="username" class="lowin-input" id="login_username">
                    </div>
                    <div class="lowin-group password-group">
                        <label>密码 <a href="#" class="forgot-link">忘记密码?</a></label>
                        <input type="password" name="password" autocomplete="current-password" class="lowin-input" id="login_password">
                    </div>
                    <div class="lowin-group type_group">
                        <label>类型 </label>
                        <input type="radio" value="personal" name="user_type" class="lowin-input" style="width: auto">
                        <label style="width: auto">个人账号</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="company"name="user_type" class="lowin-input" style="width: auto;">
                        <label style="width: auto">企业账号</label>
                    </div>
                    <div class="lowin-group val_group">
                        <label>验证码</label>
                        <input type="text" name="val" class="lowin-input" id="login_val" autocomplete="off" onblur="checkVal(this)" style="width: 40%">
                        <img onclick="reloadImg(this)" src="${pageContext.request.contextPath }/user/val">
                        <span id="checkVal"></span>
                    </div>
                    <button class="lowin-btn login-btn">
                        登录
                    </button>

                    <div class="text-foot">
                        没有账号吗? 点击这里<a href="" class="register-link">注册</a>
                    </div>
                </form>
            </div>
        </div>

        <div class="lowin-box lowin-register">
            <div class="lowin-box-inner">
                <form onsubmit="regCheck()">
                    <div class="lowin-group">
                        <label>账号(邮箱) </label>
                        <input type="email" autocomplete="off" name="username" class="lowin-input" id="reg_username" onblur="checkUsername(this)">
                        <span id="checkUsername"></span>
                    </div>
                    <div class="lowin-group">
                        <label>密码</label>
                        <input type="password" name="password" autocomplete="current-password" class="lowin-input" id="reg_password">
                    </div>
                    <div class="lowin-group">
                        <label>再次输入密码</label>
                        <input type="password" name="passwordConfirm" class="lowin-input" id="reg_confirm" onblur="checkConfirm(this)">
                        <span id="confirm"></span>
                    </div>

                    <div class="lowin-group">
                        <label>类型 </label>
                        <input type="radio" value="personal" name="userType" class="lowin-input" style="width: auto">
                        <label style="width: auto">个人账号</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="company"name="userType" class="lowin-input" style="width: auto;">
                        <label style="width: auto">企业账号</label>
                    </div>
                    <button class="lowin-btn">
                        注册新账号
                    </button>

                    <div class="text-foot">
                        已经有账号了?点击这里 <a href="" class="login-link">登录</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <footer class="lowin-footer">
        Design By @itskodinger. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
    </footer>
</div>

<script src="${pageContext.request.contextPath }/js/auth.js"></script>
<script>
    Auth.init({
        login_url: '${pageContext.request.contextPath}/user/loginDo',
        register_url: '${pageContext.request.contextPath}/user/regDo',
        forgot_url:'${pageContext.request.contextPath}/user/login'
    });
</script>
<script src="${pageContext.request.contextPath }/js/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
    function reloadImg(obj){
        obj.src="${pageContext.request.contextPath }/user/val?"+Math.random();
    }
    function checkUsername(obj){
        var str = obj.value;
        if(str.length!=0){
            //1、创建请求对象  考虑浏览器的原因
            var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest() :new ActiveXObject("Microsoft.XMLHTTP");
            //2、打开连接
            xmlhttp.open("get","/recruit/user/checkUsername?username="+str,true);
            xmlhttp.send();
            xmlhttp.onreadystatechange=function(){
                //判断服务器是否成功响应
                if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                    //开始处理服务器的响应
                    var str = xmlhttp.responseText;
                    var data = JSON.parse(str);
                    if(data.state == 0){
                        $("#checkUsername").css("color","green");
                    }else{
                        $("#checkUsername").css("color","red");
                    }
                    $("#checkUsername").text(data.msg);
                }
            }
        }
    }
    function checkConfirm(obj){
        var str = obj.value;
        if(str.length!=0) {
            if (str == $('#reg_password').val()) {
                $("#confirm").css("color", "green");
                $('#confirm').text("√两次密码一致");
            } else {
                $("#confirm").css("color", "red");
                $("#confirm").text("×两次密码不一致");
            }
        }
    }
    function checkVal(obj){
        var str = obj.value;
        if(str.length!=0){
            //1、创建请求对象  考虑浏览器的原因
            var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest() :new ActiveXObject("Microsoft.XMLHTTP");
            //2、打开连接
            xmlhttp.open("get","/recruit/user/checkVal?valNow="+str,true);
            xmlhttp.send();
            xmlhttp.onreadystatechange=function(){
                //判断服务器是否成功响应
                if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                    //开始处理服务器的响应
                    var str = xmlhttp.responseText;
                    var data = JSON.parse(str);
                    if(data.state == 0){
                        $("#checkVal").css("color","green");
                    }else{
                        $("#checkVal").css("color","red");
                    }
                    $("#checkVal").text(data.msg);
                }
            }
        }
    }
    function loginCheck() {
        if($(".login-btn").text()=="忘记密码"){
            if ($("#login_username").val().length == 0) {
                alert("账号不能为空！");
            } else{
                alert("重置密码信息已发送到该账号邮箱！");
            }
        }else{
            if ($("#login_username").val().length == 0 || $("#login_password").val().length == 0 || $('input:radio[name="user_type"]:checked').val() == null) {
                alert("账号或密码或类型不能为空！");
            } else if ($("#login_val").val().length == 0) {
                alert("验证码不能为空！");
            }
        }
    }
    function regCheck() {
        if($("#reg_username").val().length==0||$("#reg_password").val().length==0 ||$("#reg_confirm").val().length==0
            || $('input:radio[name="userType"]:checked').val()==null){
            alert("账号或密码或类型不能为空！");
        }else{
            alert("注册成功！");
        }
    }
</script>
</body>
</html>