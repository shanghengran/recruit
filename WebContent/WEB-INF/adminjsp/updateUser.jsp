<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>更改用户信息</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/updateUserDo" method="post" enctype="multipart/form-data">
	<input type="hidden" name="uid" value="${NOW_USER.uid}">
	<span>用户名：</span><input type="text" name="username"  readonly="readonly" value="${NOW_USER.username}"/><br/>
	<span>密&nbsp;&nbsp;&nbsp;码：</span><input type="password" name="password"/><br/>
	<img width="50" height="50" src="${pageContext.request.contextPath}/photo/${NOW_USER.photo}"><br/>
	<span>头&nbsp;&nbsp;像&nbsp;：</span><input type="file" name="photo"/><br/>
	<input type="submit" value="修改"/>
</form>
</body>
</html>