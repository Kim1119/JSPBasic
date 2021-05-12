<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//화면 진입시 아이디기억하기 쿠키 검사(아이디 기억하기 쿠기를 찾아서 input태그안에 id값을 미리넣어주는 코드)
	//input태그에 미리값을 넣으려면 value속성을 이용하면 됩니다.
	Cookie[] cookies = request.getCookies();
		
	String lastId = "";
	if(cookies != null) {
		
		for(Cookie c : cookies) {
			if(c.getName().equals("idCheck") ) {
				lastId = c.getValue();
			}
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>쿠키를 사용한 로그인 연습</h3>
	
	<form action="cookie_ex01_result.jsp" method="post">
	
		아이디: <input type="text" name="id" value="<%=lastId %>"><br/>
		비밀번호: <input type="password" name="pw"><br/>
		<input type="submit" value="로그인">
		<input type="checkbox" name="idCheck" value="y">아이디기억하기
		
	</form>
	
</body>
</html>