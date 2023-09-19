<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- To make error page we have to declare like this  -->
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry ! Somthing went wrong</title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
<link href="Css/style.css" rel="stylesheet" type="text/css">
	<!-- icon  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style type="text/css">
 .banner-background {
	clip-path: polygon(30% 0, 70% 0, 100% 0, 100% 100%, 78% 93%, 33% 100%, 0 89%, 0 0);
} </style>
</head>
<body>
	<div class="container text-center">
		<img alt="" src="image/browser.png" class="">
		<h3 class="display-3">Sorry ! Something went wrong</h3>
		<%= exception %>
		<a href="index.jsp" class="btn primary-background text-white btn-lg mt-3">Home</a>
	</div>
</body>
</html>