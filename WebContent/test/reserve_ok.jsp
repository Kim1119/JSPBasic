<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//좌석 정보를 받는다.
	String[] seat = request.getParameterValues("seat");
	
	//좌석 정보를 저장할 List생성
	List<String> list = new ArrayList<>();
	
	//만약 app에 좌석정보가 있다면 list에 저장
	if(application.getAttribute("list")  != null ) {
		list = (List<String>)application.getAttribute("list");
	}
	
	
	
	//list와 seat을 비교해서 중복된 좌석이 아니라면 
	//list에 좌석정보를 더하고 app에 저장하고 화면에 출력.
	List<String> temp = new ArrayList<>();
	for(String s : seat) {
		if(list.contains(s)) {
			break;
		} else {
			temp.add(s);
		}
	}
	
	//temp와 seat의 길이가 같다면 중복이 없음. (list에 좌석정보 추가)
	if(temp.size() == seat.length ) {
		list.addAll(temp);
	}
	
	
	System.out.println(list.toString());
	//application에 같은 이름으로 저장
	application.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<h2>선택한 좌석</h2>
		<% for(String s : seat) { %>
			[<%=s %>]
		<% } %>
		
		<br>
		<b>신청결과:</b>
		<%= temp.size() == seat.length ? "<b>성공</b>" : "<b>실패(이미 예약된 좌석입니다)</b>"  %>
		
		<br>
		<a href="reserve.jsp">다시 예약하기</a>
		
	</div>






</body>
</html>