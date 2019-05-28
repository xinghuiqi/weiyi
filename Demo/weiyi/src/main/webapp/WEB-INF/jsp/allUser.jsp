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
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<title>参数列表</title>
<script type="text/javascript">  
    function del(id){  
        $.get("<%=basePath%>user/delUser?id=" + id, function(data) {
			if ("success" == data.result) {
				alert("删除成功");
				window.location.reload();
			} else {
				alert("删除失败");
			}
		});
	}
</script>
</head>
<body>
	<h6>
		<a href="<%=basePath%>user/toAddUser">添加用户</a>
	</h6>
	<table border="1">
		<tbody>
			<tr>
				<th>id</th>
				<th>参数名</th>
				<th>参数值</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
			<c:if test="${!empty userList }">
				<c:forEach items="${userList}" var="user">
					<tr>
						<td>${user.id }</td>
						<td>${user.param_name }</td>
						<td>${user.param_value }</td>
						<td>${user.remark }</td>
						<td><a href="<%=basePath%>user/getUser?id=${user.id}">编辑</a>
							<a href="<%=basePath%>user/delUser?id=${user.id}">删除</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>