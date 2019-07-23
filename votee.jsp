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
String aid=request.getParameter("aid");
String file=request.getParameter("file");
String user=session.getAttribute("user").toString();
try{
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/vote","root","Data@123");
Statement st=conn.createStatement();
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","Data@123");
Statement stm=con.createStatement();
int i=st.executeUpdate("insert into "+file+" values('"+user+"')");
ResultSet r=st.executeQuery("select count(*) from "+file+"");
while(r.next())
{
	String nn=r.getString(1);
	n=Integer.parseInt(nn);
}	
out.println("and you");
String fil=file+".wav";
int v=stm.executeUpdate("update "+aid+" set vote='"+n+"' where rep='"+fil+"' ");
ResultSet rs;
con.close();
conn.close();
}
catch(SQLIntegrityConstraintViolationException s)
{
	out.println("You already voted!"+" "+n);
	
}
finally {
	
}
%>


</body>
</html>