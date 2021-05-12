<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//랜덤한 16진수 값을 얻을 떄 사용
	UUID uuid = UUID.randomUUID();
	
	String[] arr = uuid.toString().split("-");
	
	//인증문자를 세션에 저장하고 뒤에서 정상입력인지 확인.
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
	<hr/>
	
	<form action="auth_ok.jsp" method="post">
		<h4>인증문자:<%=arr[1] %></h4>
		인증문자를 입력:<input type="text" name="code" size="10"><br/>
		<input type="submit" value="확인">	
	</form>
	
	
</body>
</html>