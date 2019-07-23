<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="new.png" type="image/png" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Farmer</title>
<style>
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
position:relative;
left:4%;
}
.q{
position:relative;
left:4%;
top:0%;}
.box input[type="submit"]
{
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
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<h1 style="text-align:center"><i>FARMER'S VOICE</i>
<a href="record.html"><button type="submit" class="p" >POST YOUR QUERY</button></a>
<a href="nfeed.jsp"><button type="submit" class="q" >NEWS FEED</button></a>
<a href="logout.jsp"><button type="submit" class="q">LOGOUT</button></a>
<a href="noti.jsp"><button type="submit" class="q">NOTIFICATIONS</button></a>
<br><br/></h1>
<div class="wrap">
<table class="head">
<tr style="color:yellow"  style="font-size:30px">
<th>Name</th>
<th>Audio</th>
<th>Reply</th>
</tr>
</table>
<% 
String user=session.getAttribute("user").toString();
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/reply","root","Data@123");
java.sql.Connection co=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","Data@123");
Statement s=co.createStatement();	
Statement st=con.createStatement();
	Statement stm=con.createStatement();
	 ResultSet rst=st.executeQuery("show tables"); 
	while(rst.next()){
		String t=rst.getString(1);
		ResultSet r=stm.executeQuery("select * from "+t+" order by time desc");
	while(r.next()) 
	{String file=r.getString(2);String aid=file.substring(0, 5);
	ResultSet rr=s.executeQuery("select count(*) from "+aid);
	while(rr.next()){ String cnt=rr.getString(1);
	%>
	<div class="inner">
	<table>
<tr>
<td style="text-align:center;font-size:28px;"><% out.println(r.getString(1));%><br><p style="font-size:14px;">
<%out.println("at"+" "+r.getString(3));%></p></td><br><br><hr>
<td colspan="1">
<%String audio="rec/"+file;%><br>
<audio controls><source src="<%out.println(audio); %>" type="audio/wav" /> </audio> </td>
<td style="text-align:center;"><form action="replay.jsp" class="box">
<input type="hidden" name="uss" value=<%out.println(r.getString(1)); %>>
<input type="hidden" name="aid" value=<%out.println(aid); %>>
<input type="submit" value="Reply"></form><%out.println(cnt+" "+"Replies"); %></td>	
<% 
	}
}
	}
%>	
</tr>
</table>
</div>
</div>
</body>
</html>