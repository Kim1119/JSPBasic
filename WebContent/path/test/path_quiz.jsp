<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- a태그를 이용해서 req_video페이지로 상대경로, 절대경로 -->
	<a href="../../request/req_video.jsp">video페이지(상대)</a>
	<a href="/JSPBasic/request/req_video.jsp">video페이지(절대)</a>
	<hr/>
	
	<!-- a태그를 이용해서 TestServlet의 URL맵핑경로를 확인해서 상대경로, 절대경로로 이동 -->
	<a href="../../kkk">서블릿이동(상대)</a>
	<a href="/JSPBasic/kkk">서블릿이동(절대)</a>
	<hr/>
	
	<!-- img태그로 java.png파일을 상대경로, 절대경로로 참조 -->
	<img src="../../request/img/java.png" width="200" alt="자바">	
	<img src="/JSPBasic/request/img/java.png" width="200" alt="자바">
	
</body>
</html>