package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JdbcSelect {

	public static void main(String[] args) {
		/*
		--계정생성
		create user JSP IDENTIFIED by JSP;
		--계정에 권한 부여
		grant resource, connect to JSP;
		--테이블스페이스지정
		alter user JSP default TABLESPACE USERS QUOTA UNLIMITED ON USERS;
		create table members(
		    id varchar2(30) primary key,
		    pw varchar2(30),
		    name varchar2(30),
		    email varchar2(30)
		);
		insert into members values('kkk123', '1234', '홍길동', 'naver');
		commit;
		 */
		
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "JSP";
		String upw = "JSP";
		
		//import java.sql.*
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from members";
		
		try {
			//1. 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2. conn생성
			conn = DriverManager.getConnection(url, uid, upw);
			
			//3. pstmt생성
			pstmt = conn.prepareStatement(sql);
			
			//4. sql실행
			rs = pstmt.executeQuery(); //select문 실행은 executeQuery(), I D U문은 executeUpdate() 실행
			
			//5. rs.next()메서드를 이용해서 다음행을 검사함과 동시에 첫번쨰 행에 접근
			while(rs.next()) {
				//행별로 처리할 구문을 작성.
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				String name = rs.getString("name");
				
				System.out.println(id);
				System.out.println(pw);
				System.out.println(name);
				System.out.println(email);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				
			}
		}
		
		
		
		
		
		
		
	}
}
