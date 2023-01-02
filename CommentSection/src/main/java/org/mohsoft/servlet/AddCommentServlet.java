package org.mohsoft.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.mohsoft.dao.AddCommentDao;
import org.mohsoft.dto.User;


public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddCommentServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    AddCommentDao addCommentDao = new AddCommentDao();
     
    try {
    	addCommentDao.add(request.getParameter("subject"), (User) request.getSession().getAttribute("customerUser"));
  
        String destPage = "userPage.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
      
    } catch (Exception ex) {
    	String destPage = "login.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}

}
