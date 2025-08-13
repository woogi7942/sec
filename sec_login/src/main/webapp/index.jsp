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
<!-- 데이터베이스(h2 db) 접속코드 -->
<%
//JDBC 연결 정보
//임베디드 모드: jdbc:h2:~/test
//메모리 모드: jdbc:h2:mem:testdb
//서버 모드: jdbc:h2:tcp://localhost/~/test
//접속에 실패했을 경우 c:\users/seoil/test.db.mv 파일을 생성(메모장)
//접속주소 : http://localhost:8888/h2-console
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
	out.print(conn);
    // 쿼리 실행
    //stmt = conn.createStatement();
    //rs = stmt.executeQuery("SELECT * FROM your_table_name");

    // 결과 출력
    /*
    while (rs.next()) {
        out.println("ID: " + rs.getInt("id") + "<br>");
        out.println("Name: " + rs.getString("name") + "<br><br>");
    }
	*/
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