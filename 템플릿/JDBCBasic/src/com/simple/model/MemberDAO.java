package com.simple.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	/*
	 * DAO는 클래스는 단순히 DB연동만 담당하기 때문에 불필요하게 객체를 여러개 생성 할 필요가 없습니다.
	 * 그래서 싱글톤 패턴을 적용해서 객체를 1개만 생성되도록 만듭니다.
	 */
	//1. 스스로 객체를 1개 생성합니다.
	private static MemberDAO instance = new MemberDAO();  
	//2. 외부에서 생성자를 호출할 수 없도록 생성자에 private제한을 붙임
	private MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("드라이버 호출 에러!");
		}
		
	}
	//3. 외부에서 객체생성을 요구하면 getter메서드를 이용해서 1번의 객체를 반환
	public static MemberDAO getInstance() {
		return instance;
	}
	
	///////////////////////////////////////////////////////////////////
	//멤버변수
	private String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	private String uid = "JSP";
	private String upw = "JSP";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//join메서드
	public int join(MemberVO vo) {
		int result = 0;
		
		String sql = "insert into members values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			//conn생성
			conn = DriverManager.getConnection(url, uid, upw);
			//pstmt생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId() );
			pstmt.setString(2, vo.getPw() );
			pstmt.setString(3, vo.getName() );
			pstmt.setString(4, vo.getPhone1() );
			pstmt.setString(5, vo.getPhone2() );
			pstmt.setString(6, vo.getPhone3() );
			pstmt.setString(7, vo.getGender() );
			
			//sql실행
			result = pstmt.executeUpdate(); //1 or 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {}
		}
				
		return result;
	}
	
	//login메서드
	public MemberVO login(String id, String pw) {
		MemberVO vo = null;
		
		String sql = "select * from members where id = ? and pw = ?";
		
		try {
			//conn생성
			conn = DriverManager.getConnection(url, uid, upw);
			//pstmt생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			//sql실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //로그인 성공
				//RS의 결과에서 컬럼값을 얻는다.
				String id2 = rs.getString("id");
				String name =rs.getString("name");
				
				//VO객체에 필요한 값을 저장한다.
				vo = new MemberVO();
				vo.setId(id2);
				vo.setName(name);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
			}
		}
		
		return vo;
	}
	
	//회원정보를 조회하는 메서드
	public MemberVO getInfo(String id) {
		MemberVO vo = null;
		
		String sql = "select * from members where id = ?";
		
		try {
			//conn
			conn = DriverManager.getConnection(url, uid, upw);
			//pstmt
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			//실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				String id2 = rs.getString("id");
				String name = rs.getString("name");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender =rs.getString("gender");
			
				vo = new MemberVO(id2, null, name, phone1, phone2, phone3, gender);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				
			}
		}
		return vo;
	}
	
	//update메서드
	public int update(MemberVO vo) {
		int result = 0;
		
		String sql = "update members set pw = ?, name = ?, phone1 = ?, phone2 =?, phone3 = ?, gender = ? where id = ?";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPw() );
			pstmt.setString(2, vo.getName() );
			pstmt.setString(3, vo.getPhone1() );
			pstmt.setString(4, vo.getPhone2() );
			pstmt.setString(5, vo.getPhone3() );
			pstmt.setString(6, vo.getGender() );
			pstmt.setString(7, vo.getId() );
			
			result = pstmt.executeUpdate(); //성공시1 반환, 실패시 0반환
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
			}
		}
		
		
		return result;
	}
	
	//delete메서드
	public int delete(String id) {
		int result = 0;
		
		String sql = "delete from members where id = ?";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
			}
		}
		return result;
	}
	
	
	
	
}
