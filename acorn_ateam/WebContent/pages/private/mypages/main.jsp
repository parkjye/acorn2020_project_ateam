<%@page import="users.dto.UsersDto"%>
<%@page import="users.dao.UsersDao"%>
<%@page import="reserve.dao.ReserveDao"%>
<%@page import="reserve.dto.ReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String users_id=(String)session.getAttribute("users_id");
	UsersDto users_dto=UsersDao.getInstance().getData(users_id);
	ReserveDto dto=ReserveDao.getInstance().myReservation(users_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<p>아이디 : <%=users_dto.getUsers_id() %></p>
	<p>핸드폰 번호 : <%=users_dto.getUsers_phone() %></p>
	<p>이메일 : <%=users_dto.getUsers_email() %></p>
	<a href="modify-form">회원 정보 수정</a>
	<a href="my-reservation">예약현황</a>
	<a href="../delete.jsp">회원탈퇴</a>
</body>
</html>