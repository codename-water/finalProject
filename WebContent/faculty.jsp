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
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
        crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Roboto+Condensed|Roboto+Slab" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <title>JUCSE</title>
</head>

<body>
	
    <div id="slideout-menu">
        <ul>
        	<li>
                <a href="login.jsp">Faculty Login</a>
            </li>
            <li>
                <a href="index.html">Home</a>
            </li>
            <li>
                <a href="blogslist.html">Notices</a>
            </li>
            <li>
                <a href="faculty.jsp">Faculty</a>
            </li>
            <li>
                <a href="about.html">About</a>
            </li>
            <li>
                <input type="text" placeholder="Search Here">
            </li>
        </ul>
    </div>

    <nav>
        <div id="logo-img">
            <a href="http://www.jaduniv.edu.in/">
                <img src="img/logo.png" alt="JU Logo">
            </a>
        </div>
        <div id="menu-icon">
            <i class="fas fa-bars"></i>
        </div>
        <ul>
        	<li>
                <a href="login.jsp">Faculty Login</a>
            </li>
            <li>
                <a href="index.html">Home</a>
            </li>
            <li>
                <a href="blogslist.html">Notices</a>
            </li>
            <li>
                <a class="active" href="faculty.jsp">Faculty</a>
            </li>
            <li>
                <a href="about.html">About</a>
            </li>
            <li>
                <div id="search-icon"></div>
            </li>
        </ul>
    </nav>
	
    <div id="searchbox">
        <input type="text" placeholder="Search Here">
    </div>
    
	<main>
		<h2 class="page-heading">Faculty Members</h2>
		
		<section>
			<% 
				String query = "select * from faculty";
				Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
				PreparedStatement statement = conn.prepareStatement(query);
				ResultSet resultset = statement.executeQuery();
				String name = "", email = "";
				while(resultset.next()) {
		
					name = resultset.getString("name");
					email = resultset.getString("email");
					
			%>
			
			
	      <div class="card">
			<a href="profile.jsp?email=<%=email %>" class="btn-readmore"><%=name %></a>
	        
	      </div>
	      
	      <% 
				}
			%>
	      
	      
	     </section>
      
		
        <footer>
            <div id="left-footer">
                <h3>Quick Links</h3>
                <p>
                    <ul>
                        <li>
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a href="about.html">About</a>
                        </li>
                        <li>
                            <a href="#">Privacy Policy</a>
                        </li>
                        <li>
                            <a href="blogslist.html">Projects and Papers</a>
                        </li>
                        <li>
                            <a href="faculty.html">Faculty</a>
                        </li>
                        <li>
                            <a href="#">Contact</a>
                        </li>
                    </ul>
                </p>
            </div>

            <div id="right-footer">
                <h3>This website is developed by :</h3>
                <a href="https://github.com/codename-water">Paritosh Saini</a>
                <br>
                <a href="#">Raghav Sharma</a>
            </div>
        </footer>

    </main>

    <script src="main.js"></script>
</body>

</html>