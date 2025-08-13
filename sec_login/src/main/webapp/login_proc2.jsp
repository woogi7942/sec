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
System.out.println(username +" " +password);
String jdbcUrl = "jdbc:h2:~/test"; // 또는 jdbc:h2:mem:testdb
String jdbcUser = "sa";
String jdbcPass = "";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;


try {
    // JDBC 드라이버 로딩
    Class.forName("org.h2.Driver");

    // 데이터베이스 연결
    conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);
	    
    // 쿼리 실행
    //쿼리 실행순서
    /*
    username에 대한 사용자 있는지 select문을 통해서 확인하고
    만약 없다면 로그인 실패(사용자 없다는 메시지 전달)
    사용자가 있을 경우 username, password같이 비교하면 됨.
    만약 일치할 경우 로그인 성공, 실패할 경우 로그인 실패
    */
    stmt = conn.createStatement();
    System.out.println("check1");
    rs 
    = stmt.executeQuery("SELECT * FROM users where username='"+username+"'");
    System.out.println("check2");
    if(!rs.next()){
    	System.out.println("실패원인:username이 전혀 존재하지 않음!!");
    	response.sendRedirect("/loginFail.jsp");
    	return;
    }
    
    //username 존재한다는 의미
    //username, password 비교
    if(!(username.equals(rs.getString("username")) 
    		&& username.equals(rs.getString("username")))){
    	System.out.println("실패원인:username이 존재하지만 패스워드가 일치않음!!");
    	response.sendRedirect("/loginFail.jsp");
    	return;
    }
    
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