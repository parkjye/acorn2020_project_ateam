<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int board_num = Integer.parseInt(request.getParameter("board_num"));
	    String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		BoardDto dto = new BoardDto();
		
		dto.setBoard_num(board_num);
		dto.setBoard_title(board_title);
		dto.setBoard_content(board_content);
		
		boolean isSuccess = BoardDao.getInstance().modifyReview(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="review-modify.jsp" method="post">
		<div class="form-group">
			<!-- 글번호 hidden처리 title, content에 readyonly TEST-->
			<input type="hidden" name="board_num" value="<%=dto.getBoard_num()%>"/>
			<input type="text" name="board_title" id="board_title" value="<%=dto.getBoard_title()%>" />
			<textarea name="board_content" id="board_content" cols="40" rows="5" ><%=dto.getBoard_content() %></textarea>
		</div>
	</form>
	
	<div class="buttonWrap">
		<button type="submit">수정</button>
		<button type="reset">취소</button>
	</div>
</body>
</html>