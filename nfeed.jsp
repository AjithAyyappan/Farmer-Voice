<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="new.png" type="image/png" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>FEED</title>
<script src="js/jquery.min.js"></script>
<script>
$(function(){
	$('.box').on('submit',function(e){
		$.ajax({
			type:'post',
			url:'likee.jsp',
			data:$(this).serialize(),
			success:function(){
			location.reload();
			}
		});
		e.preventDefault();
	});
	return false;
});
</script>
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
padding-left:3px;
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
    top: 10%;
    left: 49.7%;
    position: absolute;
 
}
.inner{
display:block;
height:560px;
overflow-y:auto;
color:darkred;
transform: translate(-50%,-50%);
background: rgba(0, 0, 0, 0.5);
color: #fff;
    top: 59%;
    left: 50%;
    position: absolute;
}
.box input[type="submit"]
{   position:absolute;
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
.bo  input[type="submit"]
{  position:absolute;
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
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.sql.*" %>
<h1><i>FARMER'S VOICE</i>
<a href="main.jsp"><button type="submit"  >Home page</button></a>
<a href="nfeed.html"><button type="submit"   >Write Something</button></a>
</h1>
<% 
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feed?useUnicode=true&characterEncoding=utf-8","root","Data@123");
Statement st=con.createStatement();
%>
<div class="wrap">
<table class="head">
<tr>		
		<th></th>
	</tr>
</table>
<% 
ResultSet rs=st.executeQuery("select * from news");
while(rs.next())
{
	String name=rs.getString(1);
	String feed=rs.getString(2);
	String time=rs.getString(3);
	String fid=rs.getString(4);
	Statement std=con.createStatement();
ResultSet rse=std.executeQuery("select count(*) from "+fid);while(rse.next()){
	String cou=rse.getString(1);
java.sql.Connection co=DriverManager.getConnection("jdbc:mysql://localhost:3306/repli?useUnicode=true&characterEncoding=utf-8","root","Data@123");
Statement s=co.createStatement();
ResultSet r=s.executeQuery("select count(*) from "+fid);while(r.next()){
	String c=r.getString(1);	
	%>	
	<div class="inner">
	<table>
<tr>
<td><p style="font-size:29px;color:yellow;"><%out.println(name); %></p><p style="font-size:17px; color:white;">
 <%out.println("at"+""+time); %>  </p><br>
<p style="font-size:17px; color:white;"><%out.println(feed); %> </p> <br><br>
 <form name="abc" id="abc"  class="box">
	    <input type="hidden" name="fid"  value=<% out.println(fid); %>>
		<input type="submit"  value="Like">
		</form> 
		
		<p style="font-size:23px;margin-left:50px;"><% out.println(cou+" "+"like(s)"); %></p>
		<form  action="repli.jsp"  class="bo">
		<input type="hidden" name="ess" value=<%out.println(name); %>>
	    <input type="hidden" name="fid"  value=<% out.println(fid); %>>
		<input type="submit"  value="Reply">
		</form> 
		<p style="font-size:23px;margin-left:60px;"><% out.println(c+" "+"Replies"); %></p><br>
   </td> <br><hr>
<% }
}
}%>
</tr>
</table> 
</div>
</div>
</body>
</html>