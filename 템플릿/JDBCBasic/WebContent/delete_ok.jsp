<%@page import="com.simple.model.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. id값은 세션에서 얻습니다.
	String id = (String)session.getAttribute("user_id");
	
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.delete(id);
	
	if(result == 1) { //탈퇴성공
		response.sendRedirect("login.jsp");
	} else {
		response.sendRedirect("login_welcome.jsp");
	}
	
	/*
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "delete from members where id = ?";

	try {
		//드라이버호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//conn생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		//pstmt
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		//sql실행
		int result = pstmt.executeUpdate(); 
		
		if(result == 1) { //성공
			session.invalidate(); //세션에 정보삭제
			response.sendRedirect("login.jsp");
		} else { //실패
			response.sendRedirect("login_welcome.jsp"); 
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e) {
			
		}
	}
	*/
%>