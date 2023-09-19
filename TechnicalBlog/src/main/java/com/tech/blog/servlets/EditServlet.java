package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.DatabaseConnection;
import com.tech.blog.helper.Helper;

@WebServlet("/editServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String userEmail = req.getParameter("user_email");
		
		String userName = req.getParameter("user_name");
		
		String userPassword = req.getParameter("user_password");
		
		String userAbout = req.getParameter("user_about");
		
		//part is used to get the image from user
		Part part = req.getPart("image");
		
		String imageName = part.getSubmittedFileName();
		
		//get the user from the session
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		user.setProfile(imageName);
		
		
		String oldFile = user.getProfile();
		
		
		//update data from database
		
		UserDao userDao = new UserDao(DatabaseConnection.getConnection());
		boolean result = userDao.updateUser(user);
		
		if(result) {
			// current image path
			String path = req.getRealPath("/")+"Pics"+File.separator+user.getProfile();
			
				//delete code
			String pathOldFile = req.getRealPath("/")+"Pics"+File.separator+oldFile;
				
			if(!oldFile.equals("Default.png")) {
				Helper.deleteFile(pathOldFile);
			}
				
				if(Helper.saveFile(part.getInputStream(), path)) {
					out.println("Profile updated...");
					Message message = new Message("Profile details updated...", "success", "alert-success");
					
					session.setAttribute("msg", message);
				}else {
					Message message = new Message("Somthing went wrong..", "error", "alert-danger");
					
					session.setAttribute("msg", message);
				}
				resp.sendRedirect("profile_06.jsp");
			}else {
				
				Message message = new Message("Somthing went wrong..", "error", "alert-danger");
				
				session.setAttribute("msg", message);
			}
	}
}













