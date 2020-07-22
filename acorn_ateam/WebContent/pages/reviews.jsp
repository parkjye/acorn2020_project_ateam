<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<% 	
    	String users_id = (String)session.getAttribute("users_id");
    	
    	//--------페이징--------
    	//한 페이지에 나타낼 row 의 갯수
		final int PAGE_ROW_COUNT=10;
		//하단 디스플레이 페이지 갯수
		final int PAGE_DISPLAY_COUNT=5;
		
		//보여줄 페이지의 번호, 넘어오는 pageNum가 없으면 1페이지 노출
		int pageNum=1;
		
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
		String strPageNum=request.getParameter("pageNum");
		
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=BoardDao.getInstance().getCount();
		
		//전체 페이지의 갯수 구하기
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//시작 페이지 번호
		int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		//dto객체
		BoardDto dto = new BoardDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<BoardDto> list = BoardDao.getInstance().getListofReviews(dto);

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에이콘팬션 이용후기</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SideBar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Main.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Home.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomIntroduce.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomCard.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Food.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css?v=<%=System.currentTimeMillis() %>" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />
    <!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Yeon+Sung&display=swap" rel="stylesheet" /> -->
    <script src="https://kit.fontawesome.com/c0a9fdc19a.js"></script>

    <script defer src="${pageContext.request.contextPath}/assets/js/navBar.js?v=<%=System.currentTimeMillis() %>"></script>


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
							<td><a href="review-detail.jsp?num=<%=tmp.getBoard_num() %>"><%=tmp.getBoard_title() %></a></td>
	
							<td><%=tmp.getBoard_view() %></td>
							<td><%=tmp.getBoard_comment_count() %></td>
							<td><%=tmp.getBoard_up() %></td>
							<td><%=tmp.getBoard_down() %></td>
						</tr>
					<%} %>
				</tbody>
			</table>
			
			<div class="pagingWrap">
				<ul>			
				<%if(startPageNum != 1) {%>
					<li><a href="reviews.jsp?pageNum=<%=startPageNum-1 %>">이전</a></li>
				<%} %>
				<%for(int i=startPageNum; i<=endPageNum; i++){ %>
					<% if(i==pageNum) {%>
						<li><a href="reviews.jsp?pageNum=<%=i %>"><%=i %></a></li>
					<%} else{%>
						<li><a href="reviews.jsp?pageNum=<%=i %>"><%=i %></a></li>
					<%} %>
				<%} %>
				<% if(endPageNum < totalPageCount){%>
					<li><a href="reviews.jsp?pageNum=<%=endPageNum+1 %>">다음</a></li>
				<%} %>
				</ul>
			</div>
		</div><!-- tableWrap -->
</body>
</html>