<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
    <form action="login_proc.jsp" method="post">
        <label for="username">아이디:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="로그인">
    </form>
</body>
</html>