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
<%--글 수정에 성공하면 detail 페이지에서 수정한 글을 확인하고
	실패하면 modify 페이지에서 재시도 할 수 있도록 한다. --%>
<%if(isSuccess){ %>
<script>
	alert("성공적으로 수정했습니다.");
	location.href="${pageContext.request.contextPath}/page/private/review-detail-form?num=<%=board_num %>.jsp";
</script>
<%} else {%>
	<script>
		alert("수정에 실패했습니다.");
		location.href="${pageContext.request.contextPath}/page/private/review-modify-form?num=<%=board_num %>.jsp";
	</script>
<%} %>
</body>
</html>