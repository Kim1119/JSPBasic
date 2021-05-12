<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 스크립트릿, 선언자, 표현식을 적절히 사용 --%>
<%!
	int total = 0;
	Random ran = new Random();
%>
<% 	//한번씩 실행될 코드를 작성
	int r = ran.nextInt(8) + 2; 
	
	total++;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
	<%= total %>번째 방문자 입니다<br/>
	<% if(total % 10 == 0) { %>
		당첨입니다!
	<% } %>
	</p>
	<hr/>
	
	<h4>랜덤 구구단 <%=r %>단</h4>
	<p>
		이번에 나온 구구단 <%=r %>단 입니다<br/>
		<% for(int i = 1; i <= 9; i++) { %>
			<%=r %> x <%= i %> = <%= r*i %><br/>
		<% } %>
	
	</p>
	
	
	
	
	
	
</body>
</html>