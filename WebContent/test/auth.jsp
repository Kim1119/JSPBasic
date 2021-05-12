<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UUID uuid = UUID.randomUUID();
	
	//문자열자르기
	String[] arr = uuid.toString().split("-");

	//인증문자를 세션에 저장
	session.setAttribute("auth", arr[1]);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>인증페이지</h2>
	<hr>
	<h2>인증문자:<%=arr[1] %> </h2>
	
	<form action="auth_ok.jsp" method="post">
	
		인증문자를 입력:<input type="text" name="code" size="10"><br>
		<input type="submit" value="인증하기">
	
	</form>
	
	
</body>
</html>