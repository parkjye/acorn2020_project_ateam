<%@page import="pension.dto.ReserveDto"%>
<%@page import="pension.dto.UsersDto"%>
<%@page import="pension.dao.ReserveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String users_id=(String)session.getAttribute("users_id");
	//int date_num=Integer.parseInt(request.getParameter("date_num"));
	
	String date=request.getParameter("date");
	String[] dates=date.split("-");
	String date_year=dates[0];
	String date_month=dates[1];
	String date_day=dates[2];
	String[] room_name=request.getParameterValues("room_name");
		
	ReserveDto dto=new ReserveDto();
	// date_num 을 못받음 DateDto 에서 가져와야함
	dto.setUsers_id(users_id);
	dto.setDate_year(date_year);
	dto.setDate_month(date_month);
	dto.setDate_day(date_day);
	dto.setRoom_name(room_name[0]);
	
	/*
	UsersDto dto=new UsersDto();
	dto.setUsers_id(id);
	dto.setUsers_pwd(pwd);
	dto.setUsers_phone(phone);
	dto.setUsers_email(email);
	
	boolean isSuccess=UsersDao.getInstance().update(dto);
*/
	// ---------------------------------------------
	
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
	
	
	
	
%>	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	// 폼으로부터 전송된 내용 받아서 가격 얼마 무슨 방 예약 내역 확인하는 코드
	// 미완성 ( 띄우질 못함 )  ReserveDao 스위치케이스 메소드 삭제해야함
	var result=confirm("예약한 방 : ");

		if(result){
			alert("예약되었습니다.");
			location.href="${pageContext.request.contextPath }/index.jsp";
		}else{
			location.href="${pageContext.request.contextPath }/reserve-form.jsp";
		}
</script>
</body>
</html>