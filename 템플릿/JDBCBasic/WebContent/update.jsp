<%@page import="com.simple.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이전화면에서 전달받은 데이터를 받습니다.
	//화면에 미리 보여지도록 처리를 하세요~ value, selected, checked
	//String id = (String)request.getAttribute("id");
	//String name = (String)request.getAttribute("name");
	//String phone1 = (String)request.getAttribute("phone1");
	//String phone2 = (String)request.getAttribute("phone2");
	//String phone3 = (String)request.getAttribute("phone3");
	//String gender = (String)request.getAttribute("gender");
	
	MemberVO vo = (MemberVO)request.getAttribute("user");
	String id = vo.getId();
	String name = vo.getName();
	String phone1 = vo.getPhone1();
	String phone2 = vo.getPhone2();
	String phone3 = vo.getPhone3();
	String gender = vo.getGender();
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>정보 수정페이지</h2>
	
	<form action="update_ok.jsp" method="post">
		아이디:<input type="text" name="id" value="<%=id %>"><br/>
		비밀번호:<input type="password" name="pw"><br/>
		이름:<input type="text" name="name" value="<%=name %>"><br/>
		전화번호:
		<select name="phone1">
			<option <%=phone1.equals("010") ? "selected" : ""%> >010</option>
			<option <%=phone1.equals("02")  ? "selected" : ""%> >02</option>
			<option <%=phone1.equals("031") ? "selected" : ""%> >031</option>
			<option <%=phone1.equals("051") ? "selected" : ""%>>051</option>
		</select>
		- <input type="text" name="phone2" size="5" value="<%=phone2 %>">
		- <input type="text" name="phone3" size="5" value="<%=phone3 %>">
		
		<br/>
		<% if(gender != null && gender.equals("m") ) { %>
		<input type="radio" name="gender" value="m" checked >남자
		<input type="radio" name="gender" value="f" >여자
		<% } else { %>
		<input type="radio" name="gender" value="m" >남자
		<input type="radio" name="gender" value="f" checked >여자
		<% } %>
		
		
		<input type="submit" value="정보수정">
		
	</form>
	
</body>
</html>