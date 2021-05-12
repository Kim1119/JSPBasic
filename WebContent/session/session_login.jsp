<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>세션 로그인 연습</h2>
	
	<form action="session_login_result.jsp" method="post">
	
		아이디:<input type="text" name="id"><br/>
		비밀번호:<input type="password" name="pw"><br/>
		닉네임:<input type="text" name="nick"><br/>
		
		<input type="submit" value="로그인">
	</form>
	
	
	<h4>http://172.30.1.48:8181/JSPBasic/session/session_login.jsp</h4>
	
</body>
</html>