package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JdbcInsert {

	public static void main(String[] args) {
		
		//insert
		Scanner scan = new Scanner(System.in);
		
		System.out.print("ID>");
		String id = scan.next();
		System.out.print("PW>");
		String pw = scan.next();
		System.out.print("NAME>");
		String name = scan.next();
		System.out.print("EMAIL>");
		String email = scan.next();
		
		
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "JSP";
		String upw = "JSP";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into members values(?, ?, ? ,?)";
		
		try {
			//1.드라이버로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
					
			//2.conn객체 생성
			conn = DriverManager.getConnection(url, uid, upw);
			
			//3.pstmt객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			//4. sql실행 
			int result = pstmt.executeUpdate(); //성공시 1을 반환, 실패시 0을반환
			
			if(result == 1) {
				System.out.println("정상 처리되었습니다.");
			} else {
				System.out.println("isnert에 실패했습니다.");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
				
			}
		}
		
		
		
		
		
		
	}
}
