<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup/signup-form</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SideBar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Main.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Home.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomIntroduce.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomCard.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Food.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css?v=<%=System.currentTimeMillis() %>" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/c0a9fdc19a.js"></script>


    <script defer src="${pageContext.request.contextPath}/assets/js/navBar.js?v=<%=System.currentTimeMillis() %>"></script>
</head>
<body>
<jsp:include page="templates/nav.jsp"></jsp:include>

<div class="container">
	<form action="signup.jsp" method="post">
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" name="users_id" id="users_id" />
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input type="password" name="users_pwd" id="users_pwd" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" name="users_email" id="users_email" />
		</div>
		<div class="form-group">
			<label for="phone">휴대폰</label>
			<input type="text" name="users_phone" id="users_phone" />
		</div>
		<button type="submit">회원가입</button>
		<button type="reset" >취소</button>
	</form>
</div>
	
</body>
</html>