<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty Register</title>
</head>
<body>
<h1>Faculty Register</h1>
<form action="register" method="post">
<pre>
    Email:         <input type="text" name="email" placeholder="Enter email here" required/>
    
    Password:      <input type="text" name="password" placeholder="Enter password here" required/>
    
    Full Name:     <input type="text" name="name" placeholder="Enter name here" required/>
    
    Designation:   <input type="text" name="designation" placeholder="Enter designation here" required/>
    
    Contact no.:   <input type="text" name="contact" placeholder="Enter contact number here" required/>
	
              <input type="submit" value="REGISTER"/>
</pre>
</form>
ALREADY REGISTERED? <a href="http://localhost:8080/jucse/login.jsp">LOGIN</a>
</body>
</html>