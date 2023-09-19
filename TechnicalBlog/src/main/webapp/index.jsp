<%@page import="com.tech.blog.helper.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechBlog Home page</title>
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
</style>
</head>
<body>

	<%-- <%
	Connection connection = DatabaseConnection.getConnection();
	%> --%>
	<!-- navbar -->
	<%@include file="navbar_01.jsp"%>

	<!-- banner -->
	<div class="container-fluid m-0 p-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>A programming language is a system of notation for writing
					computer programs. [1] Most programming languages are text-based
					formal languages, but they may also be graphical. They are a kind
					of computer language.</p>
				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-external-link"></span> Start ! its free
				</button>
				<a class="btn btn-outline-light btn-lg" href="Login.jsp"> <span
					class="fa fa-user-circle fa-spin"></span> Login
				</a>
			</div>
		</div>
	</div>

	<!-- cards -->

	<div class="container">
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Java is a high-level, class-based,
							object-oriented programming language It is a general-purpose
							programming language intended to let programmers write once, run
							anywhere (WORA)</p>
						<a
							href="https://www.scientecheasy.com/2018/07/core-java-tutorial.html/"
							class="btn primary-background text-white">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Python Programming</h5>
						<p class="card-text">Python is a high-level, general-purpose
							programming language. Its design philosophy emphasizes code
							readability with the use of significant indentation.</p>
						<a href="https://docs.python.org/3/tutorial/index.html"
							class="btn primary-background text-white">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">HTML</h5>
						<p class="card-text">The HyperText Markup Language or HTML is
							the standard markup language for documents designed to be
							displayed in a web browse</p>
						<a href="https://www.w3schools.com/html/"
							class="btn primary-background text-white">Read More</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 2nd row -->
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">CSS</h5>
						<p class="card-text">Cascading Style Sheets (CSS) is a style
							sheet language used for describing the presentation of a document
							written in a markup language such as HTML or XML</p>
						<a href="https://www.w3schools.com/css/"
							class="btn primary-background text-white">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">JavaScript Programming</h5>
						<p class="card-text">JavaScript often abbreviated as JS, is a
							programming language that is one of the core technologies of the
							World Wide Web, alongside HTML and CSS.</p>
						<a href="https://javascript.info/"
							class="btn primary-background text-white">Read More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">SQL</h5>
						<p class="card-text">Structured Query Language (SQL) is a
							domain-specific language used in programming and designed for
							managing data held in a relational database management system
							(RDBMS),</p>
						<a href="https://www.tutorialspoint.com/sql/index.htm" class="btn primary-background text-white">Read
							More</a>
					</div>
				</div>
			</div>
		</div>

	</div>


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