<%@page import="users.dao.UsersDao"%>
<%@page import="users.dto.UsersDto"%>
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
<<<<<<< HEAD:acorn_ateam/WebContent/log/login.jsp
	<script>
		location.href="${pageContext.request.contextPath }/index.jsp";
	</script>
=======
		location.href="${pageContext.request.contextPath }/index.jsp";
>>>>>>> master:acorn_ateam/WebContent/pages/login.jsp
		<%session.setAttribute("id", id);%>
<%}else{%>
	<script>
		alert("아이디 혹은 비밀번호가 틀립니다.");
<<<<<<< HEAD:acorn_ateam/WebContent/log/login.jsp
		location.href="${pageContext.request.contextPath }/log/login_form.jsp";
=======
		location.href="${pageContext.request.contextPath }/log/login-form.jsp"; 
>>>>>>> master:acorn_ateam/WebContent/pages/login.jsp
	</script>
<% }%>
</body>
</html>
