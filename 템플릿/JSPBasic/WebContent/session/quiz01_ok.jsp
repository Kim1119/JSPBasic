<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="session.example.User"%>
<%
	//앞 화면에서 저장한 user세션을 얻는다.
	User user = (User)session.getAttribute("user");
	
	String id = user.getId();
	String name = user.getName();
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%=id %>(<%=name %>)님 환영합니다.
	<%=user.getRegion() %>
	
</body>
</html>