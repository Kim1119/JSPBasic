<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String cm = request.getParameter("cm");
	String kg = request.getParameter("kg");

	double bmi = Double.parseDouble(kg) / ( Double.parseDouble(cm) /100 * Double.parseDouble(cm) /100);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	키:<%=cm %><br/>
	몸무게<%=kg %><br/>
	bmi:<%=bmi %><br/>

	<% if(bmi >= 25) { %>
		<p>과체중입니다.</p>
	<% } else if(bmi <= 18) { %>
		<p>저체중입니다.</p>
	<% } else { %>
		<p>정상입니다</p>
	<% }%>



</body>
</html>