package com.tech.blog.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.DatabaseConnection;
import com.tech.blog.helper.Helper;

@MultipartConfig
@WebServlet("/addPostServlet")
public class AddPostServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDateTime = currentDateTime.format(formatter);
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		String pTitle = req.getParameter("pTitle");
		String pContent = req.getParameter("pContent");
		String pCode = req.getParameter("pCode");
		Part part = req.getPart("pic");
		String fileName = part.getSubmittedFileName();
//		Gtting current user id
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currentUser");
		
//		out.println("your post title is :"+pTitle);
//		
//		out.println(part.getSubmittedFileName());
		
		
		
		Post post = new Post(pTitle, pContent, pCode,fileName , formattedDateTime, cid, user.getId());
		
		PostDao postDao = new PostDao(DatabaseConnection.getConnection());
		 if(postDao.savePost(post)) {
			 
//			 String path = Helper.getSubmittedFileName(part);
//			 Helper.saveFile(part.getInputStream());
			 out.println("Done");
			 
		 }else {
			 out.println("Error");
		 }
		
		
	}
}











