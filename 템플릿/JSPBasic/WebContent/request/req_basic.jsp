<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//HttpServletRequest request = new HttpServletRequest();
	//request.~~~~~
	
	//request객체에는 브라우저에 대한 정보 or 사용자가 전달하는 값 등등 많은 정보를 저장하는 바구니
	StringBuffer url = request.getRequestURL(); //URL
		
	String uri = request.getRequestURI(); //URI
	
	String path = request.getContextPath(); //컨택스트패스:서버가 프로젝트를 구분하는 경로
	
	String mtd = request.getMethod(); //요청방식
	
	String remote = request.getRemoteAddr(); //app에 접속한 ip주소
	
	System.out.println(remote);
	//172.30.1.48:8181/JSPBasic/request/req_basic.jsp
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	요청URL주소:<%=url %><br/>
	요청URI주소:<%=uri %><br/>
	루트경로:<%=path %><br/>
	요청방식:<%=mtd %><br/>
	요청아이피:<%=remote %>
	
</body>
</html>