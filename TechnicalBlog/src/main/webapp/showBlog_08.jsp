<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.DatabaseConnection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page errorPage="ErrorPage_05.jsp" %>
<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
	response.sendRedirect("Login.jsp");
	}
%>
<%
	int postId = Integer.parseInt(request.getParameter("post_id"));

	PostDao postDao = new PostDao(DatabaseConnection.getConnection());
	Post post = postDao.getPostById(postId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechBlog\\<%= post.getPostTitle()%></title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
	<!--css page  -->
<link href="Css/style.css" rel="stylesheet" type="text/css">
	<!-- icon  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style type="text/css">
 .banner-background {
	clip-path: polygon(30% 0, 70% 0, 100% 0, 100% 100%, 78% 93%, 33% 100%, 0 89%, 0 0);
} 
.post-title{
	font-weight: 100;
	font-size: 30px
}
.post-content{
	font-weight: 100;
	font-size: 25px;
}
.post-user-info{
	font-size : 20px;
	font-style: italic;
}
.row-user{
	border: 1px solid #e2e2e2;
	padding-top: 15px
}
.size{
	font-size: 30px
}



</style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark primary-background py-2 size">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk size">Tech Blog</span> </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="fa fa-home"></span> Home <span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"> <span
						class="fa fa-edit"></span> Do Post
				</a></li>

			</ul>

			<ul class="navbar-nav mr-right">

				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"> <span
						class="fa fa-user-circle"></span> <%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="logoutServlet">
						<span class="fa fa-user-plus"></span> Logout
				</a></li>

			</ul>

		</div>
	</nav>
	
	<!-- end of nav bar  -->
	
	<!-- main content of the body -->
		<div class="container">
			<div class="row my-4">
				<div class="col-md-8 offset-md-2">
					<div class="card">
						<div class="card-header primary-background text-white">
							<h4 class="post-title"><%= post.getPostTitle() %></h4>
						</div>
						<div class="card-body">
						<img class="card-img-top my-2" src="Blog_pics/<%= post.getPostPic()%>">
							<div class="row my-3 row-user">
								<div class="col-md-8">
									<% UserDao userDao = new UserDao(DatabaseConnection.getConnection());%>
									
									<p class="post-user-info">Posted by <a href="#"><%= userDao.getUserByUserId(post.getUserId()).getName() %></a> </p>
								
								</div>
								
								<div class="col-md-44">
									<p><%= post.getPostDate() %></p>
								</div>
							</div>
							<p class="post-content"><%= post.getPostContent() %></p>
							
							<br>
							<br>
							
							<div class="post-code">
								<pre>Program : <br> <%= post.getPostCode() %></pre>
							</div>
						</div>
						<div class="card-footer primary-background">
					
							<a href="#" class="btn btn-outline-light btn-sm">
								<i class="fa fa-thumbs-o-up"> <span>10</span> </i>
							</a>
					
							<a href="#" class="btn btn-outline-light btn-sm">
								<i class="fa fa-commenting-o"> <span>20</span></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<!-- end of main content -->
	
		
		<!-- profile modal -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="Pics/<%=user.getProfile()%>" class="img-fluid"
							style="max-width: 150px"> <br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- details -->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Id :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>

									<tr>
										<th scope="row">About :</th>
										<td><%=user.getAbout()%></td>
									</tr>

									<tr>
										<th scope="row">Registered Date :</th>
										<td><%=user.getCurrentTime()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- end of profile modal  -->

						<!-- profile edit -->
						<div id="profile-edit" style="display: none">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="editServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About :</td>
										<td><textarea rows="3" name="user_about"
												class="form-control">
												<%=user.getAbout()%>
											</textarea></td>
									</tr>
									<tr>
										<td>Change Profile Photo :</td>
										<td><input type="file" class="form-control" name="image"></td>
									</tr>
								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						id="edit-profile-button">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- add post modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="addPostServlet" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>
								<%
								PostDao postd = new PostDao(DatabaseConnection.getConnection());
								ArrayList<Category> postes = postd.getAllCategories();
								for (Category ct : postes) {
								%>
								<option value="<%=ct.getCid()%>"><%=ct.getCategory_name()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post titel"
								class="form-control">
						</div>
						<div class="form-group">
							<textarea name="pContent" rows="" cols="" style="height: 200px"
								class="form-control" placeholder="Enter your content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" rows="" cols="" style="height: 200px"
								class="form-control" placeholder="Enter your program(if any)"></textarea>
						</div>
						<div class="form-group">
							<label>Select your pic</label><br> <input name="pic"
								type="file">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end add post modal  -->






	<!-- javscript -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="Javascript/myjs.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {

				if (editStatus == false) {
					$('#profile-details').hide();

					$('#profile-edit').show();

					editStatus = true;

					$(this).text("Back")
				} else {
					$('#profile-details').show();

					$('#profile-edit').hide();

					editStatus = false;

					$(this).text("Edit");
				}
			});
		});
	</script>
</body>
</html>