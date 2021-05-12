<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String math = request.getParameter("math");
	
	//값이 공백이라면 다시 화면으로..
	int k, m, e = 0;
	double avg = 0;
	if(name.equals("") || kor.equals("") || eng.equals("") || math.equals("")) {
		response.sendRedirect("quiz01.jsp");
	} else {
		k = Integer.parseInt(kor);
		m = Integer.parseInt(math);
		e = Integer.parseInt(eng);
		avg = (k+e+m) / 3.0;
		if(avg >= 60) { //합격페이지로
			response.sendRedirect("quiz_01_ok.jsp");
		} else { //불합격페이지
			response.sendRedirect("quiz_01_no.jsp");
		}
	}
	

	
%>
    
    