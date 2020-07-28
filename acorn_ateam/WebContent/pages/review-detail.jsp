<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String users_id = (String)session.getAttribute("users_id");
    
    	int board_num = Integer.parseInt(request.getParameter("board_num"));
    	String getBoardNum = request.getParameter("Board_num");
    	
    	BoardDao dao = BoardDao.getInstance();
    	
    	BoardDto dto = dao.getReview(board_num);
    	dao.addBoardView(dto);
    %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SideBar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/table.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/review-detail.css?v=<%=System.currentTimeMillis() %>" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />
    <!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Yeon+Sung&display=swap" rel="stylesheet" /> -->
    <script src="https://kit.fontawesome.com/c0a9fdc19a.js"></script>

    <script defer src="${pageContext.request.contextPath}/assets/js/navBar.js?v=<%=System.currentTimeMillis() %>"></script>
  </head>
  <body>
    <jsp:include page="templates/nav.jsp"></jsp:include>
	<!-- board detail -->
    <div class="section subPage">
      <!-- label은 구분을 위해 임시로 작성했습니다. -->
      <input type="hidden" name="board_num" value="<%=dto.getBoard_num()%>" />
      <div class="board__detail__container">
      <div class="flex__columns">
        <!-- <div class="board__detail__divider"></div> -->
        <input type="hidden" name="board_title" value="<%=dto.getBoard_title()%>" />
        <span class="board__detail__title">"<%=dto.getBoard_title()%></span>
        <span class="board__detail__num"><%=dto.getBoard_num() %></span>
      </div>

      <div class="flex__columns">
        <div class="flex__columns__column">
          <!-- <div class="board__detail__divider"></div> -->
          <!-- 작성자 -->
          <input type="hidden" name="users_id" value="<%=dto.getUsers_id() %>" />
          <span id="board__id" class="board__detail__id">🎈 <%=dto.getUsers_id() %></span>

          <!-- 조회수 -->
          <input type="hidden" name="board_view" value="<%=dto.getBoard_view() %>" />
          <span ><i class="fas fa-eye"></i><%=dto.getBoard_view() %></span>

          <!-- 작성일 -->
          <input type="hidden" name="board_date" value="<%=dto.getBoard_date() %>" />
          <span><i class="fas fa-pen-fancy"></i><%=dto.getBoard_date() %></span>

          <!-- 추천수 -->
          <input type="hidden" name="board_up" value="<%=dto.getBoard_up() %>" />
          <span><i class="far fa-thumbs-up"></i><%=dto.getBoard_up() %></span>
          <!-- 비추천수 -->
          <input type="hidden" name="board_down" value="<%=dto.getBoard_down() %>" />
          <span><i class="far fa-thumbs-down"></i><%=dto.getBoard_down() %></span>
        </div>

        <div class="flex__columns__column">
          <%if(users_id != null) {%>
            <a href="review-modify-form.jsp?num=<%=dto.getBoard_num() %>"><i class="fas fa-cog"></i>수정</a>
            <a href="javascript:deleteConfirm(<%=dto.getBoard_num() %>)"><i class="fas fa-cog"></i>삭제</a>
          <%} %>
        </div>
      </div>


      <div class="flex__columns">
        <!-- 본문 -->
        <div class="contentWrap">
          <input type="hidden" name="board_content" value="<%=dto.getBoard_content()%>" />
          <div><%=dto.getBoard_content() %></div>
          <!-- comment(댓글) 추가 -->
        </div>
      </div>
    </div>
    </div>
    <jsp:include page="templates/footer.jsp"></jsp:include>

    <script>
    function deleteConfirm(board_num){
      let isDelete=confirm("해당 글을 삭제 하시겠습니까?");
      
      if(isDelete){
        location.href="${pageContext.request.contextPath}/pages/private/review-delete.jsp?board_num="+board_num;
      }	
    }
    </script>
  </body>
</html>
