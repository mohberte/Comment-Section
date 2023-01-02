package org.mohsoft.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.mohsoft.dao.CommentDao;
import org.mohsoft.dto.Comment;

public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CommentServlet() {
        super();
 
    }

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
         
        CommentDao commentDao = new CommentDao();
         
        try {
        	List<Comment> comments  = commentDao.retrieveCommnent();
            
            String destPage = "userPage.jsp";
             
            if (!comments.isEmpty()) {
           
                HttpSession session = request.getSession();
                request.setAttribute("comments", comments);

                if(session.getAttribute("adminUser")!=null)
                	destPage = "adminPage.jsp";
            }  
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
          
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
    }

}
