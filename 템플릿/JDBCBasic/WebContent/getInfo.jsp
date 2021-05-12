<%@page import="com.simple.model.MemberVO"%>
<%@page import="com.simple.model.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//정보수정 화면으로 가기전에
	//아이디 기준으로 회원정보를 조회해서 다음화면으로 전달
	String id = (String)session.getAttribute("user_id");

	/*
	1. DAO에 (MemberVO getInfo(id) )형식의 메서드를 선언하고, 데이터베이스에서
	   회원정보를 가지고 나옵니다.
	2. request에서 다음화면으로 전달할 값을 저장하고, update페이지로 포워드 이동하고 화면에 값을 처리
	*/
	
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO vo = dao.getInfo(id); //호출하고 회원정보를 반환
	
	if(vo != null) { //정보조회성공
		
		request.setAttribute("user", vo);//request에 vo저장
		request.getRequestDispatcher("update.jsp").forward(request, response);
	} else { //세션이 만료된경우
		response.sendRedirect("login.jsp");
	}
	
	


	/*
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from members where id = ?";

	try {
		//드라이버호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//conn생성
		conn = DriverManager.getConnection(url, uid, upw);
		//pstmt생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id); //? 파라미터 세팅
		//sql실행
		rs = pstmt.executeQuery();
		
		if(rs.next() ) {
			String id2 = rs.getString("id");
			String name = rs.getString("name");
			String phone1 = rs.getString("phone1");
			String phone2 = rs.getString("phone2");
			String phone3 = rs.getString("phone3");
			String gender = rs.getString("gender");
			
			//포워드로 전달하기 위해
			request.setAttribute("id", id2);
			request.setAttribute("name", name);
			request.setAttribute("phone1", phone1);
			request.setAttribute("phone2", phone2);
			request.setAttribute("phone3", phone3);
			request.setAttribute("gender", gender);
			
			//포워드이동
			request.getRequestDispatcher("update.jsp").forward(request, response);
			
		} else { //세션이 만료된경우
			response.sendRedirect("login.jsp");
		}
		
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e2) {
			
		}
	}
	
	
	*/
	
%>