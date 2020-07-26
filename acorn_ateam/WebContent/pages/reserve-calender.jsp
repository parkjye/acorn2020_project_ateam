<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB에서 json이든 배열형태든 어떤 데이터로 받아오겠지요?
	//배열로 뭔가 생겨있을거아냐 ?
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- js, css파일을 클라우드에서 다운로드하는 방식  -->
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
<link rel="stylesheet" href="https://nhn.github.io/tui.calendar/latest/examples/css/icons.css">

<!-- If you use the default popups, use this. -->
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
<script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>

<script defer type="module"  src="${pageContext.request.contextPath}/assets/js/main.js?v=<%=System.currentTimeMillis() %>"></script>
   
</head>
<body>
<h1>예약달력이 나오는 페이지 입니다.</h1>
<!-- 우측상단에 Today, 이전달, 다음달 버튼 div -->
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

<!-- 달력 height크기는 임시로 지정합니다. -->
<div id="calendar" style="height: 500px;"></div>


<script>

</script>

</body>
</html>