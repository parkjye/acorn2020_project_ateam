<%@page import="users.dto.UsersDto"%>
<%@page import="users.dao.UsersDao"%>
<%@page import="reserve.dao.ReserveDao"%>
<%@page import="reserve.dto.ReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String users_id=(String)session.getAttribute("users_id");
	UsersDto users_dto=UsersDao.getInstance().getData(users_id);
	//ReserveDto dto=ReserveDao.getInstance().myReservation(users_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SideBar.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/MyPage.css?v=<%=System.currentTimeMillis() %>" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css?v=<%=System.currentTimeMillis() %>" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />
<script src="https://kit.fontawesome.com/c0a9fdc19a.js"></script>

<script defer src="${pageContext.request.contextPath}/assets/js/navBar.js?v=<%=System.currentTimeMillis() %>"></script>


</head>
<body>	
	<jsp:include page="../../templates/nav.jsp"></jsp:include>

	<div class="myPage__container">
		<div class="myPage__container__wrapper">
			<div class="flex__columns">
				<p>아이디 : <%=users_dto.getUsers_id() %></p>
			</div>
			<div class="flex__columns">
				<p>핸드폰 번호 : <%=users_dto.getUsers_phone() %></p>
			</div>
			<div class="flex__columns">
				<p>이메일 : <%=users_dto.getUsers_email() %></p>		
			</div>
			<div class="flex__columns">
				<!-- modify-form -->
				<a href="modify-form.jsp">회원 정보 수정</a>
				<!-- "my-reservation -->
				<a href="">예약현황</a>
				<!-- ../delete.jsp -->
				<a href="">회원탈퇴</a>
			</div>
		</div>
	</div>

</body>
</html>