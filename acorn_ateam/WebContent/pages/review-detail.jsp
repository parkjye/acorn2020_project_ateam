<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	/*
    		NumberFormatException
    	*/
    	
    	//?num=xx
    	int board_num = Integer.parseInt(request.getParameter("board_num"));
    	String users_id = (String)session.getAttribute("users_id");
    
    	BoardDto dto = BoardDao.getInstance().getReview(board_num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="review-modify-form.jsp" method="post">
		<div class="form-group">
			<!-- 글번호 hidden처리 title, content에 readyonly TEST-->
			<input type="hidden" name="board_num" value="<%=dto.getBoard_num()%>"/>
			
			<input type="hidden" name="board_title" value="<%=dto.getBoard_title()%>"/>
			<input type="text" id="board_title" value="<%=dto.getBoard_title()%>" disabled/>
		
			<input type="hidden" name="board_content" value="<%=dto.getBoard_content()%>"/>
			<textarea name="board_content" cols="40" rows="5" disabled><%=dto.getBoard_content() %></textarea>
		</div>
	</form>
	
	<%if(users_id != null) {%>
	<div class="aWrap">
		<a href="review-modify-form.jsp?num=<%=dto.getBoard_num() %>">수정</a>
		<a href="javascript:deleteConfirm(<%=dto.getBoard_num() %>)">삭제</a>
	</div>
	<%} %>
<script>
	function deleteConfirm(board_num){
		let isDelete=confirm(board_num+"번 글을 삭제 하시겠습니까?");
		
		if(isDelete){
			location.href="${pageContext.request.contextPath}/pages/private/review-delete.jsp?num="+board_num;
		}
	}	
</script>
</body>
</html>