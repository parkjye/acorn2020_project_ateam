<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <% 
    	BoardDao dao = BoardDao.getInstance();
    	List<BoardDto> list = dao.getListofReviews();
    	
    	String users_id = (String)session.getAttribute("users_id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(users_id != null) {%>
	<button onclick="location.href='${pageContext.request.contextPath}/pages/private/review-write-form.jsp'">글쓰기</button>
	<%} %>
	<div class="tableWrap">
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성일</th>

					<th>작성자</th>
					<th>제목</th>

					<th>조회수</th>
					<th>댓글수</th>
					<th>추천</th>
					<th>비추천</th>
				</tr>
			</thead>
			<tbody>
				<% for(BoardDto tmp:list) {%>
					<tr>
						<td><%=tmp.getBoard_num() %></td>
						<td><%=tmp.getBoard_date() %></td>

						<td><%=tmp.getUsers_id() %></td>
						<td><%=tmp.getBoard_title() %></td>

						<td><%=tmp.getBoard_view() %></td>
						<td><%=tmp.getBoard_comment_count() %></td>
						<td><%=tmp.getBoard_up() %></td>
						<td><%=tmp.getBoard_down() %></td>
					</tr>
				<%} %>
			</tbody>
	</table>
	</div>
</body>
</html>