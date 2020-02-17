<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<style>
table td {
	padding:2px 5px;
	border:1px solid black;
}
</style>

<%

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/mydb?useSSL=false";
String userId = "mydb";
String password = "mydb";

try {
	Class.forName(driverName);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;


try {
	connection = DriverManager.getConnection(connectionUrl, userId, password);
	statement = connection.createStatement();
	String sql = "SELECT * FROM thetable";
	resultSet = statement.executeQuery(sql);
	%>
	<table>
	<%
	while (resultSet.next()) {
		%>
		<tr><td><%= resultSet.getInt("id") %></td><td><%= resultSet.getString("label") %></td></tr>
		<%
	}
	%>
	</table>
	<%
} catch (Exception e) {
	e.printStackTrace();
}


%>


