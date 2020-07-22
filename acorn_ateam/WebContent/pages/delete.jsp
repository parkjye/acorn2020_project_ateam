<%@page import="pension.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	boolean isSuccess=UsersDao.getInstance().delete(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var result=confirm("계속 진행하시겠습니까?");
	
	if(result){
		alert("감사합니다.");
		<% session.invalidate(); %>
		location.href="${pageContext.request.contextPath }/index.jsp";
	}else{
		location.href="${pageContext.request.contextPath }/mypage.jsp";
	}
</script>
</body>
</html>