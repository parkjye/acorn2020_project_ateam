<%@page import="pension.dao.UsersDao"%>
<%@page import="pension.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	
	UsersDto dto=new UsersDto();
	dto.setUsers_id(id);
	dto.setUsers_pwd(pwd);
	dto.setUsers_email(email);
	dto.setUsers_phone(phone);
	
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
</script>
</body>
</html>