<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키가 필요하다면 어느페이지에서든 사용
	Cookie[] cookies = request.getCookies();
	
	String id = "";
	if(cookies != null) {
		
		for(Cookie c : cookies) {
			if(c.getName().equals("user_id")  ) {
				id = c.getValue();
			}
		}
	}
	
	//쿠키가 없다면 리다이렉트
	if(id.equals("")) {
		response.sendRedirect("cookie_ex01.jsp");
	}
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인 성공페이지</h3>
	
	<%=id %>님 환영합니다.
	
	
	
</body>
</html>