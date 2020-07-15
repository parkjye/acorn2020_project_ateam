<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write-review-form</title>
</head>
<body>
<div class="wrap">
	<div class="content">
		<form action="write-review.jsp" method="post">
			<label for="board_title">제목</label>
			<input type="text" name="board_title" id="board_title"/>
			
			<label for="board_content">내용</label>
			<textarea name="board_content" id="board_content" cols="30" rows="10"></textarea>
			
			<button type="submit">등록</button>
			<button type="reset">취소</button>
		</form>
	</div>
</div>
</body>
</html>