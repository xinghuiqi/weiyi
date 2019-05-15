<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>nmz</title>
</head>
<body>
<!--
JDBC 驱动名及数据库 URL 
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
 -->
<sql:setDataSource var="weiyidata" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/weiyidata?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>

<!-- 实现查询功能 -->
<sql:query dataSource="${weiyidata}" var="result">
SELECT * from zhubiao;
</sql:query>
<h1>JSP 数据库实例</h1>
<table border="1" width="100%">
<tr>
   <th>ID</th>
   <th>站点名</th>
   <th>站点地址</th>
   <th>站点地址</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.param_name}"/></td>
   <td><c:out value="${row.param_value}"/></td>
    <td><c:out value="${row.remark}"/></td>
</tr>
</c:forEach>
</table>


<!--
插入数据
 -->
 <%-- 
 <sql:update dataSource="${weiyidata}" var="result">
INSERT INTO zhubiao (param_name,param_value,remark) VALUES ('686', 32, 'cba');
</sql:update>--%>
<sql:query dataSource="${weiyidata}" var="result">
SELECT * from zhubiao;
</sql:query>



<!--
删除 ID 为6 的数据
 -->
<sql:update dataSource="${weiyidata}" var="count">
  DELETE FROM zhubiao WHERE Id = ?
  <sql:param value="${6}" />
</sql:update>
 
 
 <!--
修改 ID 为 5 的名字：957改为 jkl
 -->
<c:set var="SiteId" value="8"/>
 
<sql:update dataSource="${weiyidata}" var="count">
  UPDATE zhubiao SET param_name = 'uzi' WHERE Id = ?
  <sql:param value="${SiteId}" />
</sql:update>


</body>
</html>