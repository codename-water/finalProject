package jucse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String designation = request.getParameter("designation");
			String contact = request.getParameter("contact");

			String query = "select * from faculty where email='" + email +"'" ;
			Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultset = statement.executeQuery();
			if (resultset.next()) {
				out.println("<h1>Faculty member already exists in the database. Please login.</h1>");
				out.println("Want to go to login page? \r\n" + 
						"<a href=\"http://localhost:8080/jucse/login.jsp\">FACULTY LOGIN</a> ") ;
			} else {
				query = "insert into faculty values('"+email+"','"+password+"','"+name+"','"+designation+"','"+contact+"')";
				statement = conn.prepareStatement(query);
				statement.execute();
				out.println("<h1>Faculty member has been registered!</h1>");
				out.println("Want to go to login page? \r\n" + 
						"<a href=\"http://localhost:8080/jucse/login.jsp\">FACULTY LOGIN</a> ") ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
