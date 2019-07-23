<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
h1{
position:fixed;
z-index:2;
text-align:center;
font-size:50px;
background-color:darkblue;
width:100%;
height:80px;
margin-top:1px;
color:white;
}
button{
  border-width:2px;
    outline: none;
    height: 40px;
    cursor:pointer;
    background:darkblue;
    color: #fff;
    font-size: 18px;
    border-radius: 10px;
}
.p{
position:relative;
left:4%;
}
body{
    margin:0;
    padding:0;
    background: url(38.jpg);
    background-size: cover;
    background-position:top;
    background-repeat:no-repeat;
      background-attachment:fixed;
    font-family: sans-serif;
}
.wrap{
width:800px;
}
.wrap table{
width:760px;
table-layout:fixed;
}
table tr td{
padding:1px;
border:0;
width:100px;
word-wrap:break-word;
}
table.head{
margin-top:0px;
color:darkred;
transform: translate(-50%,-50%);
background: rgba(0, 0, 0, 0.5);
color: #fff;
    top: 20%;
    left: 49.7%;
    position: absolute;
 
}
.inner{
display:block;
height:500px;
overflow-y:auto;
color:darkred;
transform: translate(-50%,-50%);
background: rgba(0, 0, 0, 0.5);
color: #fff;
    top: 59%;
    left: 50%;
    position: absolute;
}
</style>
<title>Notifications</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<h1 style="text-align:center"><i>FARMER'S VOICE</i>
<a href="main.jsp"><button type="submit" class="p" >HOME</button></a>
</h1>
<div class="wrap">
<table class="head">
<tr style="color:yellow"  style="font-size:30px">
<th>NOTIFICATIONS</th>
</tr>
</table>
<% 
String user=session.getAttribute("user").toString();
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notify","root","Data@123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from "+user);
while(rs.next()){
	%><div class="inner">
	<table><tr><td style="font-size:25px"><% out.println(rs.getString(1));%><br><p style="font-size:14px"><% out.println(rs.getString(2));%></p></td><br><hr>
	
	<%
}
%>
</tr>
</table>
</div>
</div>
</body>
</html>