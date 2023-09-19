package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		// when user logout his profile we have to remove state of that user 
		HttpSession session = req.getSession();
		session.removeAttribute("currentUser");
		
		Message message = new Message("Logout successfully", "success", "alert-success");
		
		session.setAttribute("msg", message);
		resp.sendRedirect("Login.jsp");
		
	}
}
