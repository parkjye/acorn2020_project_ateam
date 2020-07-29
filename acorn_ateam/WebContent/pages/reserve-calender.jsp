<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="date.dto.DateDto"%>
<%@page import="date.dao.DateDao"%>
<%
	DateDao dao = DateDao.getInstance();
	List<DateDto> list = dao.getDateList();
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>에이콘/예약하기</title>

    <!-- js, css파일을 TOAST Cloud에서 다운로드하는 방식 -->
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
    <link rel="stylesheet" href="https://nhn.github.io/tui.calendar/latest/examples/css/icons.css">
    <!-- If you use the default popups, use this. -->
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
    <script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
    <script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
    <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
    <script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>


    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Main.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Calender.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SignUp.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer.css?v=<%=System.currentTimeMillis() %>" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/c0a9fdc19a.js"></script>

    <script type="module" src="${pageContext.request.contextPath}/assets/js/calender.js?v=<%=System.currentTimeMillis() %>"></script>
    <script defer src="${pageContext.request.contextPath}/assets/js/navBar.js?v=<%=System.currentTimeMillis() %>"></script>
  </head>
  <body>
    <jsp:include page="templates/nav.jsp"></jsp:include>

    <div class="section subPage">
      <div class="container">
        <h1 class="calender__title"> 📢 예약 현황을 확인하세요</h1>
        <div id="menu">
          <span id="menu-navi">
              <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
              <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
              <i class="calendar-icon ic-arrow-line-left" data-action="move-prev"></i>
              </button>
              <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
              <i class="calendar-icon ic-arrow-line-right" data-action="move-next"></i>
            </button>
          </span>
          <span id="renderRange" class="render-range"></span>
        </div>
        
        <div id="calendar"></div>
        <a id="calendar__button" href="#" class="myButton"><i class="fas fa-bell"></i>  예약하기</a>
      </div>
    </div>
    <jsp:include page="templates/footer.jsp"></jsp:include>
  </body>
</html>



