<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup/signup-form</title>
</head>
<body>
<div class="container">
	<form action="signup.jsp" method="post">
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" />
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" />
		</div>
		<div class="form-group">
			<label for="phone">이메일</label>
			<input type="text" name="phone" id="phone" />
		</div>
		<button type="submit">회원가입</button>
		<button type="reset" >취소</button>
	</form>
</div>
	
</script>
</body>
</html>