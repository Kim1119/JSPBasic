<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>스크립트릿(가장많이 쓰여용~)</h3>
	<%
		int a = 1;
		if(a >= 10) {
			out.println("10보다 큽니다");
		} else {
			out.println("10보다 작습니다");
		}
	%>
	<hr/>
	<%
		for(int i = 1; i <= 10; i++) {
			out.println(i + "<br/>"); //<br/>은 브라우저에서 태그로 인식
		}
	%>
	<hr/>
	<%
		int num = (int)(Math.random() * 20) + 1;
		if(num >= 10) {
			out.println("<p>참입니다~</p>");
		} else {
			out.println("<p>거짓입니다~~</p>");
		}
	%>	
	
	<hr/>
	<% if(num >= 10) { %>
		<p>참입니다~</p>
	<% } else { %>
		<p>거짓입니다~</p>	
	<% } %>
	
	<hr/>
	1. 구구단 3단을 out.println과 br태그를 이용해서 브라우저 화면에 출력<br/>
	
	<%
		for(int i = 1; i <= 9; i++) {
			out.println(3 + " x " + i + " = " + 3*i + "<br/>");
		}
	
	%>

	<hr/>
	2. 체크박스 10개를 브라우저 생성<br/>
	<%
		for(int i = 1; i <= 10; i++) {
			out.println("<input type='checkbox'>" );		
		}
	%>
	
	<br/>
	<% for(int i = 1; i <= 10; i++) { %>
		<input type="checkbox">
	<% } %>
	
	
	
	
	
	
	
	
	
	
</body>
</html>