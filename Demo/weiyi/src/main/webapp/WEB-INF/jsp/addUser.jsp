<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>添加数据</title>

<script type="text/javascript">  
    function addUser(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>user/addUser";
		form.method = "post";
		form.submit();
	}
</script>
</head>
<body>
	<h1><b>添加数据</b></h1>
	<form action="" name="userForm">
		参数名：<input type="text" name="param_name"> 参数值：<input
			type="text" name="param_value"> 备注：<input type="text"
			name="remark"> <input type="button" value="添加"
			onclick="addUser()">
	</form>
</body>
</html>