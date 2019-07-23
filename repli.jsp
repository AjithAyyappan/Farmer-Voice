<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="new.png" type="image/png" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Replies</title>
<script src="js/jquery.min.js"></script>
<script>
$(function(){
	$('.box').on('submit',function(e){
		$.ajax({
			type:'post',
			url:'voee.jsp',
			data:$(this).serialize(),
			success:function(){
				alert("success");
			}
		});
	});
	
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
.bo input[type="submit"]
{   position:absolute;
	top:18px;
	left:68%;
	z-index:3;
    border-width:3px;
    outline: none;
    height: 40px;
    cursor:pointer;
    background:darkblue;
    color: #fff;
    font-size: 18px;
    border-radius: 10px;
}
.boy
{   position:absolute;
	top:18px;
	left:80%;
	z-index:3;
    border-width:3px;
    outline: none;
    height: 40px;
    cursor:pointer;
    background:darkblue;
    color: #fff;
    font-size: 18px;
    border-radius: 10px;
}
</style>
<%@ page import="java.io.*" %> 
<%@ page import="javax.sound.sampled.*" %> 
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
</head>
<body>
<h1><i>FARMER'S VOICE</i><a href="main.jsp">
<button type="submit" class="boy">GO TO HOME</button></a>
</h1>
<br><br><br/>
<%
request.setCharacterEncoding("UTF-8");
String fid=request.getParameter("fid");
String ess=request.getParameter("ess");%>
<div class="wrap">
<table class="head">
<tr style="color:yellow"  style="font-size:30px">
		<th>BY</th>
		<th>Reply</th>
		<th>Votes</th>
		</tr>
		</table>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/repli","root","Data@123");
Statement st=conn.createStatement();
	ResultSet rst=st.executeQuery("select * from "+fid+" order by vote desc");
	while(rst.next())
	{
	%>
		<div class="inner">
	<table>
	<tr>
		<td style="font-size:28px;text-align:center;"><% out.println(rst.getString(1));%><p style="font-size:12px">
		<%out.println("at"+" "+rst.getString(4)); %></p></td><br><hr>
		<td><% out.println(rst.getString(2)); %><br></td>
         <td style="text-align:center">
	    <form name="abc" id="abc"   class="box">
	    <input type="hidden" name="fid"  value=<% out.println(fid); %>>
		<input type="hidden" name="ess" value=<%out.println(ess); %>> 
		<input type="hidden" name="rid" value=<%out.println(rst.getString(5)); %>>
		<input type="submit"  value="vote">
		</form> <br>
		<p style="text-align:center;font-size:25px;"><% out.println(rst.getString(3)+" "); %></p></td>
		<% } %>
	</tr>
		</table>
		</div>
		</div>
		<form action="re.jsp" class="bo"><input type="hidden" name="fid" value=<%out.println(fid); %>>
		<input type="hidden" name="ess" value=<%out.println(ess); %>>
<input type="submit" value="Post Your Reply">
</form>
		</body>
</html>