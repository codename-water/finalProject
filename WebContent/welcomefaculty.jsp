<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Faculty</title>
</head>
<body>
<% 
String email = (String)session.getAttribute("email");
if(email == null || email.equals("")) {
	response.sendRedirect("index.html");
	return;
} 

out.println("<h2>Welcome "+email+"</h2>");
%>
<a href="http://localhost:8080/jucse/logout.jsp">LOGOUT</a>
<br><br>
<%
out.println("<a href=\"http://localhost:8080/jucse/profile.jsp?email="+email+"\">VIEW MY PROFILE</a>");
%>



</body>
</html>