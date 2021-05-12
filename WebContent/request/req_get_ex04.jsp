<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String number = request.getParameter("number");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>요기는 ex04페이지~</h3>
	
	get방식주소로 넘어온값:<br/>
	<%=name %><br/>
	<%=number %>
	
	
</body>
</html>