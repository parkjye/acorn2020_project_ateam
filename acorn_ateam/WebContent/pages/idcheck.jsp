<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String users_id=request.getParameter("users_id");
	boolean isExist=UsersDao.getInstance().idcheck(users_id);
%>
{"isExist":<%=isExist %>}