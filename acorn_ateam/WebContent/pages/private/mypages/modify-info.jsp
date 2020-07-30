
<%@page import="users.dao.UsersDao"%>
<%@page import="users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String users_id=(String)session.getAttribute("users_id");
	String users_pwd=request.getParameter("users_pwd");
	String users_phone=request.getParameter("users_phone");
	String users_email=request.getParameter("users_email");
	
	UsersDto dto=new UsersDto();
	dto.setUsers_id(users_id);
	dto.setUsers_pwd(users_pwd);
	dto.setUsers_phone(users_phone);
	dto.setUsers_email(users_email);
	
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
	location.href="${pageContext.request.contextPath }/pages/private/mypages/main.jsp";
</script>
<%}else{ %>
<script>
	alert("수정 실패");
	location.href="${pageContext.request.contextPath }/pages/private/mypages/update-form.jsp";
</script>
<%} %>
</body>
</html>