<%@page import="pension.dao.UsersDao"%>
<%@page import="pension.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	UsersDto dto=new UsersDto();
	dto.setUsers_id(id);
	dto.setUsers_pwd(pwd);
	
	boolean isValid=UsersDao.getInstance().isValid(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(isValid){%>
		location.href="../index.jsp";
		<%session.setAttribute("id", id);%>
<%}else{%>
	<script>
		alert("아이디 혹은 비밀번호가 틀립니다.");
	</script>
<% }%>
</body>
</html>