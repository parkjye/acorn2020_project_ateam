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
	
	String[] room_name=new String[4];
	for(int i=0;i<checked.length;i++){
		room_name[i]=checked[i];
	}
	for(int i=0;i<room_name.length;i++){
		ReserveDto dto=new ReserveDto();
		
		dto.setUsers_id(users_id);
		dto.setDate_year(date_year);
		dto.setDate_month(date_month);
		dto.setDate_day(date_day);
		dto.setRoom_name(room_name[i]);
		
		int date_num=ReserveDao.getInstance().getDateNum(dto);
		dto.setDate_num(date_num);
	}
	
	/*
	UsersDto dto=new UsersDto();
	dto.setUsers_id(id);
	dto.setUsers_pwd(pwd);
	dto.setUsers_phone(phone);
	dto.setUsers_email(email);
	
	boolean isSuccess=UsersDao.getInstance().update(dto);


	
	String day1=request.getParameter("1days");
	String day2=request.getParameter("2days");
	String day3=request.getParameter("3days");
	String day4=request.getParameter("4days"); 
	
	String[] checked=request.getParameterValues("check");
	
	int[] msg=new int[4];
	msg[0]=Integer.parseInt(day1);
	msg[1]=Integer.parseInt(day2);
	msg[2]=Integer.parseInt(day3);
	msg[3]=Integer.parseInt(day4);
	
	ReserveDao dao=ReserveDao.getInstance();
	
	int price=0;
	String alert="";
	
	for(int i=0;i<checked.length;i++){
		if(checked[i].equals("1")){
			price+=(Integer.parseInt(day1))*200000;
			dao.switchCase(msg[0]);
		}
		if(checked[i].equals("2")){
			price+=(Integer.parseInt(day2))*200000;	
			dao.switchCase(msg[1]);
		}
		if(checked[i].equals("3")){
			price+=(Integer.parseInt(day3))*200000;	
			dao.switchCase(msg[2]);
		}
		if(checked[i].equals("4")){
			price+=(Integer.parseInt(day4))*200000;	
			dao.switchCase(msg[3]);
		}
	}
	
	for(int i=0;i<checked.length;i++){
		System.out.println(checked[i]+" 강의실");
	}
	System.out.println("가격 : "+price);
	
	*/
	
	
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
  	<jsp:include page="templates/nav.jsp"></jsp:include>
  	
  	
  	<script>
		// 폼으로부터 전송된 내용 받아서 가격 얼마 무슨 방 예약 내역 확인하는 코드
		// 미완성 ( 띄우질 못함 )  ReserveDao 스위치케이스 메소드 삭제해야함
		var result=confirm("예약한 방 : ");
	
		if(result){
			alert("예약되었습니다.");
			location.href="${pageContext.request.contextPath }/index.jsp";
		}else{
			location.href="${pageContext.request.contextPath }/reserve-detail.jsp";
		}
	</script>
</body>
</html>