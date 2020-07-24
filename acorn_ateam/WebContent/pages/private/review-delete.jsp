<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    <%
    	int board_num = Integer.parseInt(request.getParameter("board_num"));
    	boolean isSuccess = BoardDao.getInstance().deleteReview(board_num);
    	
    	String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/pages/reviews.jsp");
    %>