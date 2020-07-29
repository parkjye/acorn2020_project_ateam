<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String users_id = (String)session.getAttribute("users_id");
    
    	String board_title = request.getParameter("board_title");
    	String board_content = request.getParameter("board_content");
    	
    	BoardDto dto = new BoardDto();
    	dto.setUsers_id(users_id);
    	dto.setBoard_title(board_title);
    	dto.setBoard_content(board_content);
    	
    	boolean isSuccess = BoardDao.getInstance().writeReview(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("작성한 글이 저장되었습니다.");
		location.href="../reviews.jsp";
	</script>
	<%} else{ %>
	<script>
		alert("작성한 글 저장에 실패했습니다.");
		location.href="review-write-form.jsp";
	</script>
<%} %>
</body>
</html>