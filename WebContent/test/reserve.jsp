<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인증이 없는 사람은 접근하지 못하도록 처리
	if(session.getAttribute("authYN") == null) {
		response.sendRedirect("auth.jsp");
	}
	
	//화면에 들어왔을 때 app좌석정보가 있다면, 정보를 얻어옵니다.
	List<String> list = new ArrayList<>();
	if(application.getAttribute("list") != null) {
		list = (List<String>)application.getAttribute("list");
	}
	
	System.out.println(request.getRemoteAddr());
	
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
	checkbox, radio를 선택하게 하는 옵션 checked
	select태그에서 미리 선택하게 하는 옵션은 selected
	input태그에 반드시 값을 입력하세요 required
	input태그를 읽기속성 readonly
	 -->

	<div align="center">
		<h2>영화 좌석 예약</h2>
		<h4>예약할 좌석을 체크한 후 예약 버튼을 클릭하세요.</h4>
		<hr>


		<form action="reserve_ok.jsp" method="post">
			<b>좌석배치도</b>
			
			<br>&nbsp;&nbsp;
			<% for(char c = 'A'; c <= 'Z'; c++) { %>
				<small><%=c %></small>&nbsp;&nbsp;
			<% } %>
			<br>
			
			<% for(int i = 1; i <= 6; i++) { %>
				<%=i %>
				<% for(char c= 'A'; c <= 'Z'; c++) { %>
					
				<input type="checkbox" name="seat" value="<%=c %>-<%=i %>" <%=list.contains(c+"-"+i) ? "disabled" : "" %>>
					
				<% } %>
				
				
				<%= i == 3 ? "<br>": "" %>
				<br>	
			<% } %>
			
			<br>
			<input type="submit" value="예약">
			<input type="reset" value="초기화">
			
		</form>
	</div>
	
	<script>
	function check() {
		//좌석의 체크여부를 확인할 변수 입니다.
		var seat_check;
		//문서의.네임이(seat) 인 태그의 값을 check 변수에 모두 담습니다.
		//자바스크립트는 변수 타입이 유동적 이기때문에 타입에 맞춰서 자동으로 배열로 선언됩니다.
		var check = document.getElementsByName("seat");
		for (var i = 0; i < check.length ; i++) {
			//배열의 길이만큼 회전하면서 체크 되어있는지 확인 합니다.
			//하나라도 체크되어 있다면 seat_check를 true로 변경 하고 탈출 합니다.
			if(check[i].checked == true){
				seat_check = true;
				break;
			}
		}
		//3항 연산식 입니다 seat_check가 true이라면,
		//문서의.reg_form  <== form의 name 입니다.
		//submit() 전송하는 함수입니다.
		
		//false 라면 경고창을 띄웁니다.
		seat_check == true ? document.reg_form.submit() : alert("예약할 좌석을 선택해주세요.");
	
	}

</script>      
	</script>
	
</body>
</html>