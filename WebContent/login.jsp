<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty Login</title>
</head>
<body>
<h1>Faculty Login</h1>
<form action="login" method="post">
<pre>
    Email:    <input type="text" name="email" placeholder="Enter email here" required/>
    
    Password: <input type="text" name="password" placeholder="Enter password here" required/>
    
              <input type="submit" value="LOGIN"/>
</pre>
</form>
NOT REGISTERED? <a href="http://localhost:8080/jucse/register.jsp">SIGN UP</a>
</body>
</html>