package org.mohsoft.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import org.mohsoft.dao.UserDAO;
import org.mohsoft.dto.User;

public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLoginServlet() {
        super();
    }

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	         
	        System.out.println("Coming from: " +request.getRequestURL().toString());
	        UserDAO userDao = new UserDAO();
	         
	        try {
	            User user = userDao.checkLogin(email, password);
	            String destPage = "/admin/login.jsp";
	             
	            if (user != null) {
	                HttpSession session = request.getSession();
	              
	                if(user.getEmail().equals("admin@gmail.com"))
	                {session.setAttribute("adminUser", user);
	                destPage = "adminPage.jsp";
	                String message = "Is an admin";
	                request.setAttribute("message", message);
	                
	                
	                if (session != null) {
	                    session.removeAttribute("customerUser");
	                }
	                }
	                else
	                {
	                	 String message = "Invalid email/password";
	 	                request.setAttribute("message", message);
	                }
	                
	            } else {
	                String message = "Invalid email/password";
	                request.setAttribute("message", message);
	                
	            }          
	            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
	            dispatcher.forward(request, response);
	             
	        } catch (SQLException | ClassNotFoundException ex) {
	            throw new ServletException(ex);
	        }
	    }

}
