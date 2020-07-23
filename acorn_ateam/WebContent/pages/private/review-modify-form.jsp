<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int board_num = Integer.parseInt(request.getParameter("board_num"));
	    String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		BoardDao dao = BoardDao.getInstance();
		BoardDto dto = dao.getReview(board_num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="review-modify.jsp" method="post">
		<div class="form-group"> </div>
			<!-- board_num은 사용자에게 hidden -->
			<input type="hidden" name="board_num" value="<%=dto.getBoard_num()%>"/>
		
			<!-- label은 구분을 위해 임시로 작성했습니다. -->
			<label for="board_title">제목</label>
			<input type="text" name="board_title" id="board_title" value="<%=dto.getBoard_title()%>"/>
			
			<input type="hidden" name="board_date" value="<%=dto.getBoard_date() %>"/>
			<label for="board_date">날짜</label>
			<input type="text" id="board_date" value="<%=dto.getBoard_date() %>" disabled/>
			
			<input type="hidden" name=board_view value="<%=dto.getBoard_view() %>"/>
			<label for="board_view">조회수</label>
			<input type="text" id="board_view" value="<%=dto.getBoard_view() %>" disabled/>
			
			<input type="hidden" name=board_up value="<%=dto.getBoard_up() %>"/>
			<label for="board_up">추천</label>
			<input type="text" id="board_up" value="<%=dto.getBoard_up() %>" disabled/>
			
			<input type="hidden" name=board_down value="<%=dto.getBoard_down() %>"/>
			<label for="board_down">비추</label>
			<input type="text" id="board_down" value="<%=dto.getBoard_down() %>" disabled/>

			<label for="board_content">내용</label>
			<textarea name="board_content" id="board_content" cols="40" rows="5" ><%=dto.getBoard_content() %></textarea>
			
			<!-- comment(댓글) 추가 -->
			
		<div class="buttonWrap">
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>