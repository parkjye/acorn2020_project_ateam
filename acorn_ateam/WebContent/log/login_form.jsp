<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<form action="login.jsp" method="post">
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" />
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" />
			</div>
			<input type="submit" value="로그인" />
		</form>
	</div>
</body>
</html>