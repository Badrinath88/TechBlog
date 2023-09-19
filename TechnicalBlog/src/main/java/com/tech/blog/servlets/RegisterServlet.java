package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.DatabaseConnection;

@WebServlet("/registerServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String check = req.getParameter("check");
		
		// Get the current date and time using java.time.LocalDateTime
		LocalDateTime currentDateTime = LocalDateTime.now();
		
		// Format the date and time as per the MySQL DATETIME format
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDateTime = currentDateTime.format(formatter);
		
		//here we check the user is checked the box or not ,if user is not checked then we have to 
		//asking for user to check the box
		if(check==null) {
			out.println("Please check box!");
		}else {
			String name = req.getParameter("user_name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String gender = req.getParameter("gender");
			String about = req.getParameter("about");
			
			// create user Object and set all data into user obejct

			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setGender(gender);
			user.setAbout(about);
			user.setCurrentTime(formattedDateTime);
			
			
			
			//create a UserDao object to call saveUser method
			UserDao userDao = new UserDao(DatabaseConnection.getConnection());
			boolean res = userDao.saveUser(user);
			
			if(res) {
				out.println("done");
			}else {
				out.println("Please enter all the details");
			}
		}
	}
}
