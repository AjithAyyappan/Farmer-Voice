<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>farmer</title>
</head>
<body>

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%! int n=0; %>
<%  
String fid=request.getParameter("fid");
String rid=request.getParameter("rid");
String user=session.getAttribute("user").toString();
try{
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vote","root","Data@123");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into "+fid+" values('"+user+"')");
ResultSet r=st.executeQuery("select count(*) from "+fid+"");
while(r.next())
{
	String nn=r.getString(1);
	n=Integer.parseInt(nn);
	}
out.println("and you");

java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/repli","root","Data@123");
Statement stm=con.createStatement();
int v=stm.executeUpdate("update "+fid+" set vote='"+n+"' where rid='"+rid+"' ");
ResultSet rs;
con.close();
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