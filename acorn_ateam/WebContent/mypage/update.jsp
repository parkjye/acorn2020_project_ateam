<%@page import="pension.dao.UsersDao"%>
<%@page import="pension.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	String pwd=request.getParameter("pwd");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	
	UsersDto dto=new UsersDto();
	dto.setUsers_id(id);
	dto.setUsers_pwd(pwd);
	dto.setUsers_phone(phone);
	dto.setUsers_email(email);
	
	boolean isSuccess=UsersDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(isSuccess){
%>
<script>
	alert("수정 완료");
	location.href="${pageContext.request.contextPath }/mypage.jsp";
</script>
<%}else{ %>
<script>
	alert("수정 실패");
	location.href="${pageContext.request.contextPath }/update-form.jsp";
</script>
<%} %>
</body>
</html>