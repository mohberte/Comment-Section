package org.mohsoft.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.mohsoft.dao.DeleteComment;
 

public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteCommentServlet() {
        super();
        
    }

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String id = request.getParameter("id");
	                 
	       
	        DeleteComment deleteComment = new DeleteComment();
	        
	        try {
				deleteComment.deleteCommnent(Integer.valueOf(id));
			} catch (Exception ex) {
		    	String destPage = "login.jsp";
		        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
		        dispatcher.forward(request, response);
			}
	            String destPage = "adminPage.jsp";
            
	            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
	            dispatcher.forward(request, response);
	    }
}
