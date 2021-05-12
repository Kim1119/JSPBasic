<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//a태그로 넘어오는 course변수를 받습니다.
	//course이름으로 전달되는 값이 없으면 null값이 전달됩니다.
	String course = request.getParameter("course");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<% if(course == null) { %>
		<p>잘못된 경로의 접근입니다</p>
	<% } else if(course.equals("java")) { %>
	<div align="center">
		<h2>강의 영상</h2>
		<hr/>
		<p>자바 수업소개</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/L0a6N-rj-CI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<% } else if(course.equals("js")) {%>
	<div align="center">
		<h2>강의 영상</h2>
		<hr/>
		<p>자바스크립트 수업소개</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/nOTpuof2YG8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<% } else if(course.equals("oracle")) { %>
	<div align="center">
		<h2>강의 영상</h2>
		<hr/>
		<p>오라클 수업소개</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/DEVR_R2Hva0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<% } %>	
	
	
</body>
</html>