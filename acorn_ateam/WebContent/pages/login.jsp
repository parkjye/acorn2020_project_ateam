<%@page import="users.dao.UsersDao"%>
<%@page import="users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String users_id=request.getParameter("users_id");
	String users_pwd=request.getParameter("users_pwd");
	
	UsersDto dto=new UsersDto();
	dto.setUsers_id(users_id);
	dto.setUsers_pwd(users_pwd);
	
	boolean isValid=UsersDao.getInstance().isValid(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(isValid){%>
	<script>
		location.href="${pageContext.request.contextPath }/index.jsp";
	</script>
		<%session.setAttribute("users_id", users_id);%>
<%}else{%>
	<script>
		alert("아이디 혹은 비밀번호가 틀립니다.");
		location.href="${pageContext.request.contextPath }/pages/login-form.jsp"; 
	</script>
<% }%>
</body>
</html>
