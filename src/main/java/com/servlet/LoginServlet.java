package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        // Perform your authentication logic here
        boolean isAuthenticated = authenticate(username, password);

        if (isAuthenticated) {
            // Redirect to home.html if authentication is successful
//            response.sendRedirect("studentHome.jsp");
        	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        	rd.forward(request, response);
        } else {
            // Redirect back to login.html if authentication fails`
//        	request.setAttribute("errorMessage","Invalid Email or Registration");
        	RequestDispatcher rd = request.getRequestDispatcher("errorindex.html");
        	rd.forward(request, response);
//            response.sendRedirect("index.html");
        }
    }

    private boolean authenticate(String username, String password) {
        // Database credentials
        String dbUrl = "jdbc:mysql://localhost:3306/student";
        String dbUsername = "root";
        String dbPassword = "pritambose2002";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create a connection to the database
            Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // Prepare the SQL statement to check if the email and reg no are valid
            String sql = "SELECT * FROM studentlist WHERE email = ? AND reg_no = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            // If a matching record is found, authentication is successful
            if (resultSet.next()) {
                // Close the database resources
                resultSet.close();
                statement.close();
                connection.close();
                return true;
            }

            // Close the database resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return false; // Authentication failed
    }
}
