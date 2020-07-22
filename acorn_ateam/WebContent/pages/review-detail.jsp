<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int board_num = Integer.parseInt(request.getParameter("num"));
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
	<div class="wrap">
		<!-- board_num은 사용자에게 hidden -->
		<input type="hidden" name="board_num" value="<%=dto.getBoard_num()%>"/>
		
		<!-- label은 구분을 위해 임시로 작성했습니다. -->
		<div class="contentWrap">
			<input type="hidden" name="board_title" value="<%=dto.getBoard_title()%>"/>
			<label for="">제목</label>
			<input type="text" id="board_title" value="<%=dto.getBoard_title()%>" disabled/>
			
			<input type="hidden" name="users_id" value="<%=dto.getUsers_id() %>"/>
			<label for="">작성자</label>
			<input type="text" id="users_id" value="<%=dto.getUsers_id() %>" disabled/>
			
			<input type="hidden" name="board_date" value="<%=dto.getBoard_date() %>"/>
			<label for="">날짜</label>
			<input type="text" id="board_date" value="<%=dto.getBoard_date() %>" disabled/>
			
			<input type="hidden" name=board_view value="<%=dto.getBoard_view() %>"/>
			<label for="">조회수</label>
			<input type="text" id="board_view" value="<%=dto.getBoard_view() %>" disabled/>
			
			<input type="hidden" name=board_up value="<%=dto.getBoard_up() %>"/>
			<label for="">추천</label>
			<input type="text" id="board_up" value="<%=dto.getBoard_up() %>" disabled/>
			
			<input type="hidden" name=board_down value="<%=dto.getBoard_down() %>"/>
			<label for="">비추</label>
			<input type="text" id="board_down" value="<%=dto.getBoard_down() %>" disabled/>
		</div>
		
		<div class="contentWrap">
			<input type="hidden" name="board_content" value="<%=dto.getBoard_content()%>"/>
			<textarea name="board_content" cols="40" rows="5" disabled><%=dto.getBoard_content() %></textarea>
			
			<!-- comment(댓글) 추가 -->
		</div>
	</div><!-- wrap -->
	
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