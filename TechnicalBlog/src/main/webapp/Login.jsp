<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="Css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0, 70% 0, 100% 0, 100% 100%, 78% 93%, 33% 100%, 0 89%, 0 0);
}
</style>
</head>
<body>
	<!--  navbar-->
	<%@include file="navbar_01.jsp"%>

	<main
		class="d-flex align-items-center primary-background banner-background"
		style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span> <br>
							<p>Login here</p>
						</div>
						
						
						<!-- If user put some wrong info then we have to show some errot msg
							to show error msg we have to get those msg from Message object which we declare 
							insdie the LoginServlet page
						 -->
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
						 <div class="alert <%= message.getCssClass() %>">
							<%= message.getContent() %>
						</div>
						<%
						 	 session.removeAttribute("msg"); 
						}
						%> 
						<div class="card-body">
						<!-- brought this form from bootstrap 4 -->
							<form action="loginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										name="email" required="required" type="email"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="password" required="required" type="password"
										class="form-control" id="exampleInputPassword1"
										placeholder="Password">
								</div>

								<div class="container text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

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

	<script type="text/javascript" src="Javascript/myjs.js"></script>
</body>
</html>