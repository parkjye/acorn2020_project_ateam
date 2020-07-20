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
<title>에이콘팬션 이용후기</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Home.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomIntroduce.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomCard.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Food.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css" />


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Yeon+Sung&display=swap" rel="stylesheet" />
<script src="https://kit.fontawesome.com/c0a9fdc19a.js" crossorigin="anonymous"></script>
<script defer src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</head>
<body>
	<jsp:include page="templates/nav.jsp"></jsp:include>
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