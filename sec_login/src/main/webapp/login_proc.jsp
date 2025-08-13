<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String username=request.getParameter("username");
String password=request.getParameter("password");
String jdbcUrl = "jdbc:h2:~/test"; // 또는 jdbc:h2:mem:testdb
String jdbcUser = "sa";
String jdbcPass = "";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


try {
    // JDBC 드라이버 로딩
    Class.forName("org.h2.Driver");

    // 데이터베이스 연결
    conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);
   
    //?=자동으로 ''생성
    String sql="SELECT * FROM users where username=? and password=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, username);
    pstmt.setString(2, password);
    rs=pstmt.executeQuery();
    if(!rs.next()){
    	System.out.println("결과:로그인 실패!!");
    	response.sendRedirect("/loginFail.jsp");
    	return;
    }
    System.out.println("결과:로그인 성공!!");
    response.sendRedirect("/loginSuccess.jsp");

    
} catch (Exception e) {
    out.println("에러 발생: " + e.getMessage());
    e.printStackTrace();
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
}
%>
</body>
</html>