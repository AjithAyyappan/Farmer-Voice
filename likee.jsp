<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>_</title>
</head>
<body>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<% 

String fid=request.getParameter("fid");
String user=session.getAttribute("user").toString();
try{
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/feed","root","Data@123");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into "+fid+" values('"+user+"')");
out.println("and you");
conn.close();
}
catch(SQLIntegrityConstraintViolationException s)
{
	out.println("You already voted!");
}
finally {
	
}
%>
</body>
</html>