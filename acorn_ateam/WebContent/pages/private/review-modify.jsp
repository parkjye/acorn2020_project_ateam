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
<%if(isSuccess){ %>
<script>
	alert("성공적으로 수정했습니다.");
	location.href="../review-detail.jsp?board_num=<%=board_num %>";
</script>
<%} else {%>
	<script>
		alert("수정 실패했습니다.");
		location.href="review-modify-form.jsp?board_num=<%=board_num %>";
	</script>
<%} %>
</body>
</html>