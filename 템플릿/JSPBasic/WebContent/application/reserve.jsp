<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//authYN(인증) 이 없는 사람은 인증을 하고 오도록 처리
	//if(session.getAttribute("authYN") == null) {
	//	response.sendRedirect("auth.jsp");
	//}

	//화면에 들어올때 application에 좌석정보가 있다면, 해당 정보를 꺼내서 저장.
	List<String> list = new ArrayList<>();
	
	if(application.getAttribute("list") != null) {
		list = (List<String>)application.getAttribute("list");
	}
	
	System.out.println("접속자:" + request.getRemoteAddr());
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 
	태그를 선택하지 못하도록 처리하는 옵션 disabled
	checkbox, radio를 미리 선택되게 하는 옵션 checked
	select태그에서 미리 값을 선택되게 하는 옵션 selected
	input태그를 읽기만 허용하는 속성 readonly
	input태그의 값을 반드시 입력하게 하는 속성 required	
	 -->
	
	<div align="center">
		<h2>영화 예매 페이지</h2>
		<h4>좌석을 체크한 후에 예약 버튼을 클릭하세요</h4>
		<hr/>
		
		<form action="reserve_ok.jsp" method="post">
			<b>좌석 배치도</b>
			<br/>
			
			&nbsp;&nbsp;
			<% for(char c = 'A'; c <= 'Z'; c++) { %>
				<small><%=c %></small>&nbsp;&nbsp;  
			<% } %>
			
			<br/>
			<% for(int i = 1; i <= 6; i++ ) { %>
				
				<%=i %>
				
				<% for(char c = 'A'; c <= 'Z'; c++) { %>
				
					<% if(list.contains(c +"-" + i) ) { %>
					<input type="checkbox" name="seat" value="<%=c %>-<%=i %>" disabled>
					<% } else {%>
					<input type="checkbox" name="seat" value="<%=c %>-<%=i %>" >
					<% } %>
					
					
					
				<% } %>
				<br/>
				
				<%=i == 3 ? "<br/>": "" %>
				
			<% } %>
			
			<br/>
			<input type="submit" value="예약">
			<input type="reset" value="초기화">
			
		</form>
		
	</div>
	
</body>
</html>




