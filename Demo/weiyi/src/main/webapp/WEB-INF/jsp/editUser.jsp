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
<title>修改参数</title>

<script type="text/javascript">  
    function updateUser(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>user/updateUser";
		form.method = "post";
		form.submit();
	}
</script>
</head>

<body>
	<h1>修改参数</h1>
	<form action="" name="userForm">
		id：<input type="text" name="id" value="${user.id }" readonly />
		参数名：<input type="text" name="param_name" value="${user.param_name}"/>
		
		 参数值：<input type="text" name="param_value" value="${user.param_value}"/>
		 
		  备注：<input type="text" name="remark" value="${user.remark}" /> 
		  
		  <input type="button" value="修改" onclick="updateUser()">
	</form>
</body>
</html>

