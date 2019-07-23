<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="new.png" type="image/png" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>News</title>
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
body{
    margin:0;
    padding:0;
    background: url(38.jpg);
    background-size: cover;
    background-position:top;
    background-repeat:no-repeat;
      background-attachment:fixed;
    font-family:sans-serif,Banu;
}
.login-box{
	margin-top:70px;
    width: 320px;  
    height:520px;
    background: rgba(0, 0, 0, 0.5);
    color: #fff;
    top: 50%;
    left: 50%;
    position: absolute;
    transform: translate(-50%,-50%);
    box-sizing: border-box;
    padding: 70px 30px;
}

.h{
	
    margin: 0;
    padding: 0 0 20px;
    text-align: center;
    font-size: 22px;
}
.login-box p{
    margin: 0;
    padding: 0;
    font-weight: bold;
}
.login-box input{
    width: 100%;
    margin-bottom: 80px;
}
.login-box input[type="text"], input[type="password"]
{
    border: none;
    border-bottom: 1px solid #fff;
    background: transparent;
    outline: none;
    height: 40px;
    color: #fff;
    font-size: 16px;
}
.login-box input[type="submit"]
{
 	margin-left:30%;
 	margin-top:15%;
    border: none;
    outline: none;
    height: 40px;
    width:100px;
    background: #1c8adb;
    color: #fff;
    font-size: 18px;
    border-radius: 20px;
}
.login-box input[type="submit"]:hover
{
    cursor: pointer;
    background: #39dc79;
    color: #000;
}
.login-box a{
    text-decoration: none;
    font-size: 14px;
    color: #fff;
}
.login-box a:hover
{
    color: #39dc79;
}
p{
margin-top:8%;
font-size:20px;
font-family:sans-serif;
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
</style>
</head>
<body>
<%
String fid=request.getParameter("fid");
String ess=request.getParameter("ess");
%>
<h1><i>FARMER'S VOICE</i>
<a href="main.jsp"><button type="submit" value="HOME">HOME</button></a>
<a href="nfeed.jsp"><button type="submit" value="VIEW NEWSFEED">VIEW NEWSFEED</button></a>
</h1>
<div class="login-box">
<form action="conti.jsp" method="post" accept-charset="UTF-8">
Write Something Here:
<textarea  name="feed" rows="20" cols="30" ></textarea><br><br> 
<input type="hidden" name="fid" value=<%out.println(fid); %>>
		<input type="hidden" name="ess" value=<%out.println(ess); %>>
<input type="submit" value="POST"/>
</form>
</div>
</body>
</html>