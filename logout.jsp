<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="shortcut icon" href="new.png" type="image/png" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Logout</title>
</head>
<body>
<%
session.removeAttribute("user");
session.invalidate();
response.sendRedirect("index.html");
%>

</body>
</html>