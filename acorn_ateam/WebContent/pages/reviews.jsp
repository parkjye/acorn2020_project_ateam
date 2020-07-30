<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<% 	
    	String users_id = (String)session.getAttribute("users_id");
	
		//dao 생성
		BoardDao dao = BoardDao.getInstance();

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
		
		
		// ---------- 키워드 ----------
		//키워드와 비교할 condition을 얻어온다.
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");

		//전달된 키워드가 없으면 빈 문자열을 담는다.
		if(keyword == null){ 
			keyword="";
			condition="";
		}
		
		//키워드 인코딩 한다.
		String encodedK=URLEncoder.encode(keyword);
		
		//인코딩된 키워드를 미리 만들어 둔다. 
		/*String encdingK = "";
		
		try {	
			//키워드가 null이면 Exception발생 (인코딩된 키워드)
			encdingK = URLEncoder.encode("keyword");
		}catch(Exception e){}
		*/
		
		//키워드, startRowNum, endRowNum을 담을 Dto객체 생성
		BoardDto dto = new BoardDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
				
		//select 된 결과를 담을 List
		List<BoardDto> list = null;

		//-------------------------------
		int totalRow = 0;
		
		if(!keyword.equals("")) {
			if(condition.equals("title_users")){ //제목+작성자
				/*
					1. 검색 키워드를 Dto객체의 필드에 담는다.
					2. 키워드에 맞는 파일 목록 얻어온다.
					3. 2번 목록 중에서 pageNum에 해당하는 값을 얻어온다.
				*/
				dto.setBoard_title(keyword);
				dto.setUsers_id(keyword);
				
				list = dao.getWordTitleUsers(dto);
				System.out.println("토탈로우 진입전");
				totalRow = dao.getWordTitleUsersRow(dto);
				
			}else if(condition.equals("board_title")){ //제목
				dto.setBoard_title(keyword);
			
				list = dao.getWordTitle(dto);
				totalRow = dao.getWordTitleRow(dto);
				
			}else if(condition.equals("users_id")) { //작성자
				dto.setUsers_id(keyword);
			
				list = dao.getWordUsers(dto);
				totalRow = dao.getWordUsersRow(dto);
				
			}
		}else { //검색 키워드가 없으면 전체 목록을 얻어온다.
			list = dao.getListofReviews(dto);
			totalRow = dao.getCount();
		}
		System.out.println(totalRow);
		
		
		//-------------------------------System.out.println(list);-------
		//전체 페이지의 갯수 구하기
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//시작 페이지 번호, 끝 페이지 번호
		int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
    
    
		%>
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8" />
      <title>에이콘팬션 이용후기</title>

      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?v=<%=System.currentTimeMillis() %>" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=<%=System.currentTimeMillis() %>" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?v=<%=System.currentTimeMillis() %>" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SideBar.css?v=<%=System.currentTimeMillis() %>" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/table.css?v=<%=System.currentTimeMillis() %>" />
       <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomIntroduce.css?v=<%=System.currentTimeMillis() %>" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/RoomCard.css?v=<%=System.currentTimeMillis() %>" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Food.css?v=<%=System.currentTimeMillis() %>" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css?v=<%=System.currentTimeMillis() %>" />

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />

      <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />
      <!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Yeon+Sung&display=swap" rel="stylesheet" /> -->
      <script src="https://kit.fontawesome.com/c0a9fdc19a.js"></script>

			<script defer src="${pageContext.request.contextPath}/assets/js/navBar.js?v=<%=System.currentTimeMillis() %>"></script>
			
				<!-- 화살표 크기 조절을 위한 임시 style입니다. -->
			<style>
				.arrow{
					width: 10px;
					height: 10px;
				}
			</style>
    </head>
    <body>
      <jsp:include page="templates/nav.jsp"></jsp:include>

      <div class="section subPage">
        <div class="tableWrap">
          <table class="table">
            <thead>
              <tr>
                <th class="hidden">글번호</th>
                
                <th>제목</th>
                <th>댓글수</th>

                <th>조회수</th>
                <th>작성자</th>
                <th>추천</th>
                <th>비추천</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody>
              <% for(BoardDto tmp:list) {%>
              <tr>
                <td><%=tmp.getBoard_num() %></td>
     
                <td>
                  <a href="review-detail.jsp?board_num=<%=tmp.getBoard_num() %>"><%=tmp.getBoard_title() %></a>
                  <td><%=tmp.getBoard_comment_count() %></td>
                </td>

                <td><%=tmp.getBoard_view() %></td>
                <td><%=tmp.getUsers_id() %></td>
                <td><%=tmp.getBoard_up() %></td>
                <td><%=tmp.getBoard_down() %></td>
                <td><%=tmp.getBoard_date() %></td>
              </tr>
              <%} %>
            </tbody>
          </table>
        </div>
        
        <div class="button__writer__btn">
			<%if(users_id != null) {%>
			<button class="myButton" onclick="location.href='${pageContext.request.contextPath}/pages/private/review-write-form.jsp'">후기쓰기</button>
			<%} %>
		</div>
		
		<!-- 키워드 검색 -->
		<form action="reviews.jsp" method="get">
			<button onclick="location.href='reviews.jsp'">목록 보기</button>
			<label for="condition">검색 조건</label>
			<select name="condition" id="condition">
				<option value="title_users" <%if(condition.equals("title_users")){%>selected<%} %>>작성자+제목</option>
				<option value="board_title" <%if(condition.equals("board_title")){%>selected<%} %>>제목</option>
				<option value="users_id" <%if(condition.equals("users_id")){%>selected<%} %>>작성자</option>
			</select>
			<input type="text" name="keyword" placeholder="검색어 입력"/>
			<button type="submit">검색</button>
		</form>

		<!-- 페이징 -->
		<div class="pagingWrap">
			<ul>			
			<%if(startPageNum != 1) {%>
				<li>
					<a href="reviews.jsp?pageNum=<%=startPageNum-1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">
					<img class="arrow" src="${pageContext.request.contextPath}/assets/images/arrow-left.png" alt="arrow-left" /></a>
				</li>
			<%} %>
			
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<% if(i==pageNum) {%>
					<li class="paging__active">
						<a href="reviews.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a>
					</li>
				<%} else{%>
					<li>
						<a href="reviews.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a>
					</li>
				<%} %>
			<%} %>
			
			<% if(endPageNum < totalPageCount){%>
				<li>
					<a href="reviews.jsp?pageNum=<%=endPageNum+1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">
					<img class="arrow" src="${pageContext.request.contextPath}/assets/images/arrow-right.png" alt="arrow-right" /></a>
				</li>
			<%} %>
			</ul>
		</div>
      </div> <!-- section subPage -->
    	<jsp:include page="templates/footer.jsp"></jsp:include>
    </body>
  </html>
