<%@page import="reserve.dao.ReserveDao"%>
<%@page import="reserve.dto.ReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String users_id=(String)session.getAttribute("users_id");
	
	// 날짜 가져와서 '-' 로 연,월,일 분류
	String date=request.getParameter("date");
	String[] dates=date.split("-");
	String date_year=dates[0];
	String date_month=dates[1];
	String date_day=dates[2];
	
	String[] checked=request.getParameterValues("check");
	
	//String room_name="";
	String[] room_name=new String[4];
	for(int i=0;i<checked.length;i++){
		room_name[i]=checked[i];
	}
	for(int i=0;i<room_name.length;i++){
		ReserveDto dto=new ReserveDto();
		ReserveDao dao=ReserveDao.getInstance();
		
		int date_num=dao.getDateNum(date_day, room_name[i]);
		
		dto.setUsers_id(users_id);
		dto.setDate_num(date_num);
		dto.setDate_year(date_year);
		dto.setDate_month(date_month);
		dto.setDate_day(date_day);
		dto.setRoom_name(room_name[i]);
		
		boolean isSuccess=dao.insert(dto);
	}

%>	

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에이콘팬션 예약하기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Reset.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navbar.css?v=<%=System.currentTimeMillis() %>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/SideBar.css?v=<%=System.currentTimeMillis() %>" />
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

  	
  	
  	<script>	
		if(isSuccess){
			alert("예약되었습니다.");
			location.href="${pageContext.request.contextPath}/index.jsp";
		}else{
			location.href="${pageContext.request.contextPath }/reserve-calender.jsp";
		}
	</script>
</body>
</html>