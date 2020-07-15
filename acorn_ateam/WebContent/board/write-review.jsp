<%@page import="pension.dao.BoardDao"%>
<%@page import="pension.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

    	String board_title = request.getParameter("board_title");
    	String board_content = request.getParameter("board_content");
    	
    	BoardDto dto = new BoardDto();
    	dto.setBoard_title(board_title);
    	dto.setBoard_content(board_content);
    	
    	boolean isSuccess = BoardDao.getInstance().writeReview(dto);
    	/*
    		[수정할 것]
    				
			1. 글 작성은 회원만 가능
			2. 따라서 글쓰기 폼에서는 제목, 내용만 받고 싶음
			3. dao.writeReview()에는 user_id가 필요함
			4. 로그인 상태인 회원의 아이디를 session을 통해서 얻어야 함
    	*/
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write-review.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p>
			작성한 글이 저장되었습니다.
			<a href="write-review-form.jsp">확인</a>
		</p>	
	<%} else{ %>
		<p>글 작성을 실패했습니다.</p>
		<a href="write-review-form.jsp">다시 작성하기</a>
	<%} %>
</body>
</html>