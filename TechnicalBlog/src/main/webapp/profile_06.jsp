<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage_05.jsp"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile page</title>
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
.size{
	font-size: 30px
}


</style>
</head>
<body>
	<!-- navbar -->

	<nav
		class="navbar navbar-expand-lg navbar-dark primary-background py-2 size">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk size">Tech Blog</span></a>
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

	<%
	Message message = (Message) session.getAttribute("msg");
	if (message != null) {
	%>
	<!-- we have to show invalid msg above the email box for only once , so here we display the invalid msg
							by calling getContent() method from message object.
							
							And we have to display this msg only once so after displaying we just remove 
							invalid msg by calling removeAttribute.
							
							We have to display error msg in provided color in servlet page so we call getCssClass() method
						  -->
	<div class="alert <%=message.getCssClass()%>" role="alert">
		<%=message.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>

	<!-- main body of the page -->

	<main>
		<div class="container">
			<div class="row mt-4 " >
				<!--first col  -->
				<div class="col-mid-4">
					<!-- categories -->
					<div class="list-group">
						<a href="#" onclick="getPost(0)" class="list-group-item list-group-item-action active">
							All Posts </a> 
							
							<%
								PostDao postDao = new PostDao(DatabaseConnection.getConnection());
								ArrayList<Category> list1 = postDao.getAllCategories();
								for(Category c : list1){
							%>
							<!--here  this  indicates the current activated link's reference  -->
								<a href="#" onclick="getPost(<%= c.getCid() %>)" class="list-group-item list-group-item-action"><%= c.getCategory_name() %></a>
							<%
								}
							%>
					</div>
				</div>
				<!-- end col -->
				<div class="col-md-8" id="post-container">
					<!--posts -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					<div class="container-fluid" id="post-container">
						
						
					</div>
				</div>

			</div>
		</div>
	</main>
	<!-- end main body -->

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
				<!--modal body  -->
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
					<h5 class="modal-title" id="exampleModalLabel">Add Post</h5>
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
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getCategory_name()%></option>
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

	<!-- now add post js -->
	<script type="text/javascript">
		$(document).ready(function(e) {
			$("#add-post-form").on("submit",function(event) {
			/* this code get called when from is submitted */
			event.preventDefault();
			console.log("You have clicked on submit...");
			let form = new FormData(this);											
			//now requesting to server									

			$.ajax({
				url : "addPostServlet",
				type : 'post',
				data : form,
				success : function(data,textStatus,jqXHR) {
							console.log(data);
							if (data.trim() == 'Done') {
							swal("Good job!","saved successfully","success");
							} else {
								swal("Error","Somthing went wrong try again...","error");
							}
						},
				error : function(jqXHR,textStatus,errorThrown) {
						swal("Error","Somthing went wrong try again...","error");
				},
				processData : false,
				contentType : false
			})
		})
})
	</script>
	
	<!--loading post using ajax  -->
	
	<script type="text/javascript">
	function getPost(catId) {
		
		$("#loader").show();
		$("#post-container").hide();
		
		$.ajax({
			url : "loadPost_07.jsp",
			data : {cid : catId},
			success : function( data , textStatus , jqXHR) {
				console.log(data);
				$("#loader").hide();
				$("#post-container").show();
				$("#post-container").html(data);
				
			}
		})
	}
		$(document).ready(function(e) {
			getPost(0);
		})
	</script>
</body>
</html>















