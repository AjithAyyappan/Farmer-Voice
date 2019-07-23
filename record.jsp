
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title> 1234</title>
<script type="text/javascript" src="app.js"></script>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<% //page import="javax.annotation.MultipartConfig" %>
<%@ page import ="java.io.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<p> ...</p>
 <% /* <a href="main.jsp"><button type="submit">GO TO HOME</button></a> */%>
<%// AudioRecorder02 aaa=new AudioRecorder02(); 
//String file=aaa.getFile(); %>

<%// MultipartConfig(maxFileSize=169999999); %>

 <%    String aud=request.getParameter("audio_data");
	/* String user=session.getAttribute("user").toString();
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/reply","root","Data@123");
	Statement st=conn.createStatement();
	Calendar cal=Calendar.getInstance();
	SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy HH:mm");
	String time=sdf.format(cal.getTime());
		ResultSet rs; 
		int i=st.executeUpdate("insert into "+user+" values('"+user+"','"+file+"','"+time+"')"); 
		conn.close(); */
	
     
		%>
		<form action="upload" method="post" enctype="multipart/form-data">
		<input type="file" name="audio_data" value=aud>
		<input type="submit" value="post">
		</form>
</body>
</html>