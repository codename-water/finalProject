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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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

			String query = "select * from faculty where email='" + email + "'";
			Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultset = statement.executeQuery();
			if (resultset.next()) {
				if (resultset.getString("password").equals(password)) {
					HttpSession session = request.getSession();
					session.setAttribute("email", email);
					response.sendRedirect("welcomefaculty.jsp");
				} else {
					out.println("<h1>Invalid Password for the given email!</h1>");
					out.println("Want to go to home page? \r\n" + 
							"<a href=\"http://localhost:8080/jucse/register.jsp\">FACULTY REGISTER</a> ") ;
				}
			} else {
				out.println("<h1>This email does not exist in the database!</h1>");
				out.println("Want to go to home page? \r\n" + 
						"<a href=\"http://localhost:8080/jucse/register.jsp\">FACULTY REGISTER</a> ") ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
