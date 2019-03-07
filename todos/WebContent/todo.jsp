<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	Statement stmt = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/todos?serverTimezone=UTC", "root", "1234");
	
	stmt = conn.createStatement();
	if(stmt.execute("select * from todo")) {
		rs = stmt.getResultSet();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1> smjung's todos</h1>
	<hr>
<%
	while(rs.next()) {
		out.println(rs.getInt("id") + " : " + rs.getString("item"));
	}
	rs.close();
	stmt.close();
	conn.close();

%>
	<br>
	1.buy milk <br>
	2.walk with doggy <br>
	<hr>
	<form method="post" action="write.jsp">
		<input type="text" name="todo-item"></input>
		<input type="submit" value="작성" />
		
	
	</form>


</div>
</body>
</html>