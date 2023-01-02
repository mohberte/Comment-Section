package org.mohsoft.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

	@WebFilter("/*")
	public class UserFilter implements Filter {
	    private HttpServletRequest httpRequest;
	 
	    private static final String[] loginRequiredURLs = {
	            "/view_profile", "/edit_profile", "/update_profile", "/userPage"
	    };
	
	    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	            throws IOException, ServletException {
	        httpRequest = (HttpServletRequest) request;
	 
	        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
	 
	        if (path.startsWith("/admin/")) {
	        	 System.out.println("User Filter: Admin trigger");
	            chain.doFilter(request, response);
	            return;
	        }
	        
	        HttpSession session = httpRequest.getSession(false);
	 
	        boolean isLoggedIn = (session != null && session.getAttribute("customerUser") != null);
	 
	        String loginURI = httpRequest.getContextPath() + "/login";
	        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
	        boolean isLoginPage = httpRequest.getRequestURI().endsWith("login.jsp");
	 
	        if (isLoggedIn && (isLoginRequest || isLoginPage)) {
	            // the user is already logged in and he's trying to login again
	            // then forward to the homepage
	        	   httpRequest.getRequestDispatcher("/").forward(request, response);
	            
	        } else if (!isLoggedIn && isLoginRequired()) {
	            // the user is not logged in, and the requested page requires
	            // authentication, then forward to the login page
	        	 String loginPage = "/login.jsp";
	            RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
	            dispatcher.forward(request, response);
	        } else {
	            // for other requested pages that do not require authentication
	            // or the user is already logged in, continue to the destination
	            chain.doFilter(request, response);
	        }
	    }
	 
	 
	    private boolean isLoginRequired() {
	        String requestURL = httpRequest.getRequestURL().toString();
	 
	        for (String loginRequiredURL : loginRequiredURLs) {
	            if (requestURL.contains(loginRequiredURL)) {
	                return true;
	            }
	        }
	 
	        return false;
	    }
	 
	    public UserFilter() {
	    }
	 
	    public void destroy() {
	    }
	 
	    public void init(FilterConfig fConfig) throws ServletException {
	    }
	}
	 