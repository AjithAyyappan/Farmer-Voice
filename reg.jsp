 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="new.png" type="image/png" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>registering</title>
<style>
body{
    margin: 0;
    padding: 0;
    background: url(88.jpg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;
}
button{
height:60px;
margin-left:45%;
color:white;
background-color:blue;
width:150px;
}
</style>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String user=request.getParameter("user_id");
String pwd=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/my_db","root","Data@123");
Statement st=con1.createStatement();
ResultSet rs;
int i=st.executeUpdate("insert into users(user,password) values('"+user+"','"+pwd+"')");
out.println("You are registered successfully..");
java.sql.Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/reply","root","Data@123");
Statement st2=con2.createStatement();
int j=st2.executeUpdate("create table "+user+"(user varchar(20),record blob,time varchar(20)) ");
java.sql.Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/notify","root","Data@123");
Statement st3=con3.createStatement();
int k=st3.executeUpdate("create table "+user+"(noti varchar(40),time varchar(20)) ");
con1.close();
con2.close();
con3.close();
session.setAttribute("use",user);
response.sendRedirect("index.html");
%>
<a href="login.html"><button type="submit" style="margin-top:40px">LOGIN NOW</button></a><br>
<a href="index.html"><button type="submit" style="margin-top:40px">HOME</button></a>

</body>
</html>