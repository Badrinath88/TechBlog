package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.DatabaseConnection;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDao userDao = new UserDao(DatabaseConnection.getConnection());

		User user = userDao.getEmailAndPassword(email, password);

		if (user == null) {
			// login error msg
//			out.println("Invalid details...try again");

			Message message = new Message("Invalid Details ! try with another", "error", "alert-danger");
			HttpSession session = req.getSession();
			session.setAttribute("msg", message);
			
			resp.sendRedirect("Login.jsp");

		} else {
			HttpSession session = req.getSession();
			session.setAttribute("currentUser", user);
			resp.sendRedirect("profile_06.jsp");
		}
	}
}
