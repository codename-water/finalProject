<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*"
    import="java.sql.*"
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./profstyle.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> 
    <title>Profile Page</title>
</head>
<body>
	<% 
		String email = (String)request.getParameter("email");
		if(email == null || email.equals("")) {
			response.sendRedirect("index.html");
			return;
		} 
		String query = "select * from faculty where email='" + email + "'";
		Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
		PreparedStatement statement = conn.prepareStatement(query);
		ResultSet resultset = statement.executeQuery();
		String name = "", designation = "", contact = "";
		if(resultset.next()) {

			name = resultset.getString("name");
			designation = resultset.getString("designation");
			contact = resultset.getString("contact");
		}
	%>
    <div class="container">
        <div class="profile-header">
            <div class="profile-img">
                <img src="img/NA.png" width="200px" alt="">
            </div>
            <div class="profile-nav-info">
                <h3 class="user-name"><%=name %></h3>
                <h4 class="user-des"><%=designation %></h4>
            </div>
            <div class="contact">
                <i class="fa fa-phone cont"><%=contact %></i>
                <i class="fa fa-envelope cont" aria-hidden="true"><a href="abc@xyz.com"><%=email %></a></i>
            </div>
            
            
        </div>
    </div>
    
</body>
</html>