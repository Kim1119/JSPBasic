<%@page import="com.simple.model.MemberDAO"%>
<%@page import="com.simple.model.MemberVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 폼에서 넘어온 데이터를 각각 처리합니다.
	2. SQL문을 이용해서 DB에 업데이트 작업. executeUpdate()
	3. executeUpdate()는 성공시 1을 반환, 실패시 0을반환
	4. 업데이트가 성공하면 세션에 저장된 이름을 변경한 후에
	   update_success.jsp로 리다이렉트
	   
	   업데이트에 실패하면, update_fail.jsp로 리다이렉트
	*/
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	//VO에 form값 저장
	MemberVO vo = new MemberVO(id, pw, name, phone1, phone2, phone3, gender);
	
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.update(vo);
	
	if(result == 1) { //성공
		session.setAttribute("user_name", name);
	
		response.sendRedirect("update_success.jsp");	
	} else {
		response.sendRedirect("update_fail.jsp");
	}
	
	
	/*
	//DB연결에 필요한 변수
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	String sql = "update members set pw = ?, name = ?, phone1 = ?, phone2 = ?, phone3 =?, gender= ? where id = ?";
	
	try {
		//드라이버 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//conn생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		//pstmt생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1 , pw );
		pstmt.setString(2 , name );
		pstmt.setString(3 , phone1 );
		pstmt.setString(4 , phone2 );
		pstmt.setString(5 , phone3 );
		pstmt.setString(6 , gender );
		pstmt.setString(7 , id);
		
		//sql실행
		int result = pstmt.executeUpdate();
		
		if(result == 1) { //성공
			session.setAttribute("user_name", name); //세션에 정보 수정
						
			response.sendRedirect("update_success.jsp");
		} else { //실패
			response.sendRedirect("update_fail.jsp");
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





