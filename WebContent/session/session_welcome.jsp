<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션이 없는 사람이라면, 화면에 접근 불가.
	if(session.getAttribute("user_id") == null) {
		response.sendRedirect("session_login.jsp");//강제이동
	}
	
	String id = (String)session.getAttribute("user_id");
	String nick = (String)session.getAttribute("user_nick");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%=id %>(<%=nick %>)님 환영합니다.
	
	<a href="session_logout.jsp">로그아웃</a>
	
	
</body>
</html>