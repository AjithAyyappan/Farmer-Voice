<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>login</title>
</head>
<script type="text/javascript">
function btn(){
document.getElementById("btn").disabled=false;
}
</script>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String user=request.getParameter("uid");
String pwd=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/my_db","root","Data@123");
Statement st=con1.createStatement();
ResultSet rs=st.executeQuery("select * from users where user='"+user+"'");
if(rs.next())
{
	if(rs.getString(2).equals(pwd))
	{
	out.println("Welcome..."+user);
	session.setAttribute("user", user);
	response.sendRedirect("main.jsp");
	}
    else
	{ out.println("Username or password is incorrect!!!");
	}
}
	con1.close();
	 %>
	 </body>
	</html>
