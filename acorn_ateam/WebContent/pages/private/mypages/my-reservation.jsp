<%@page import="reserve.dto.ReserveDto"%>
<%@page import="reserve.dao.ReserveDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String users_id=(String)session.getAttribute("users_id");
	ReserveDto dto=ReserveDao.getInstance().myReservation(users_id);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>아이디 : <%=dto.getUsers_id() %></p>
	<p>예약 날짜 : <%=dto.getDate_year() %>년 <%=dto.getDate_month() %>월 <%=dto.getDate_day() %>일</p>
	<p>핸드폰 번호 : <%=dto.getUsers_phone() %></p>
	<p>방 이름 : <%=dto.getRoom_name() %></p>
</body>
</html>