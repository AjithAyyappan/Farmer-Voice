<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="new.png" type="image/png" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>posted</title>
<style>
h1{
position:fixed;
z-index:2;
text-align:center;
font-size:50px;
background-color:darkblue;
width:100%;
height:80px;
margin-top:0;
color:white;
}
body{
    margin:0;
    padding:0;
    background: url(88.jpg);
    background-size: cover;
    background-position:top;
    background-repeat:no-repeat;
      background-attachment:fixed;
    font-family: sans-serif;
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
.wrap{
width:1000px;
}
.wrap table{
width:960px;
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
.p{
left:4%;
}
.q{
left:4%;
top:0%;}
.box input[type="submit"]
{   position:absolute;
		left:10%;
	z-index:3;
    border: none;
    outline: none;
    height: 40px;
    cursor:pointer;
    background: #1c8adb;
    color: #fff;
    font-size: 18px;
    border-radius: 10px;
}
</style>
</head>
<body>
<h1><i>FARMER'S VOICE</i></h1>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Random" %>
<%
request.setCharacterEncoding("UTF-8");
String user=session.getAttribute("user").toString();
String feed=request.getParameter("feed");
Random random=new Random();
String fid=request.getParameter("fid");
String ess=request.getParameter("ess");
Calendar cal=Calendar.getInstance();
SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy HH:mm");
String time=sdf.format(cal.getTime());
String rid="a"+String.format("%07d",random.nextInt(10000000));
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/repli?useUnicode=true&characterEncoding=utf-8","root","Data@123");
Statement st=con.createStatement();
ResultSet rs;
String fed="நீங்கள் எப்படி இருக்கிறீர்கள்?";
int i=st.executeUpdate("insert into "+fid+"(user,rep,time,rid) values('"+user+"','"+feed+"','"+time+"','"+rid+"')");
java.sql.Connection cooo=DriverManager.getConnection("jdbc:mysql://localhost:3306/notify","root","Data@123");
Statement sttm=cooo.createStatement();
String abcd=user+" "+"replied to your post at";
int y=sttm.executeUpdate("insert into "+ess+" values('"+abcd+"','"+time+"')");
%>
<p>Your feed is posted Successfully</p><br><br><br>
<p>To view your reply press continue:</p>
<form action="repli.jsp" method="post" class="box">
<input type="hidden" name="ess" value=<%out.println(ess); %>>
	    <input type="hidden" name="fid"  value=<% out.println(fid); %>>
<input type="submit" value="CONTINUE">
</form>
</body>
</html>