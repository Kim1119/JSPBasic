<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃-> (인증 수단 삭제)
	session.invalidate();
	
	response.sendRedirect("session_login.jsp");
%>   