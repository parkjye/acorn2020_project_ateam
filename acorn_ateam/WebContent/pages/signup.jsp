<%@page import="users.dao.UsersDao"%>
<%@page import="users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String users_id=request.getParameter("users_id");
	String users_pwd=request.getParameter("users_pwd");
	String users_email=request.getParameter("users_email");
	String users_phone=request.getParameter("users_phone");
	
	UsersDto dto=new UsersDto();
	dto.setUsers_id(users_id);
	dto.setUsers_pwd(users_pwd);
	dto.setUsers_email(users_email);
	dto.setUsers_phone(users_phone);
	
	boolean isSuccess=UsersDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup/signup</title>
</head>
<body>
<script>
	alert("회원가입 완료");
	// 세션 받아서 바로 자동 로그인 후 메인 페이지 이동
	location.href = "${pageContext.request.contextPath}/index.jsp"
</script>
</body>
</html>