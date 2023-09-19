<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Css folder link -->
<link href="Css/style.css" rel="stylesheet" type="text/css">

<!-- icon link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0, 70% 0, 100% 0, 100% 100%, 78% 93%, 33% 100%, 0 89%, 0 0);
}
</style>
</head>
<body>
	<%@include file="navbar_01.jsp"%>
	<main class="primary-background p-5 banner-background">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-3x fa-user-circle fa-spin"></span>
						<p>Register here</p>
					</div>
					<div class="card-body">
						<form id="reg-form" action="registerServlet" method="post">

							<div class="form-group">
								<label for="userName">User Name</label> 
								<input name="user_name"
									type="text" class="form-control" id="userName"
									aria-describedby="emailHelp" placeholder="Enter User Name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> 
								<input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> 
									<small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.
									</small>
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> 
								<input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>


							<div class="form-group">
								<label for="gender">Select Gender</label> <br> 
								
								<input type="radio" id="gender" name="gender" value="male">Male
								<input type="radio" id="gender" name="gender" value="female">Female
								<input type="radio" id="gender" name="gender" value="other">Other

							</div>

							<div class="form-group">
								<textarea name="about" class="form-control" rows="5" cols="30"
									placeholder="Enter Somthing about yourself"></textarea>
							</div>

							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree terms and condition</label>
							</div>
							<br>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<h4>Please wait...</h4>
							</div>

							<button id="subimt-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			console.log("Loaded....")
			/* jquery */
			$('#reg-form').on('submit', function(event) {
				event.preventDefault();

				let form = new FormData(this);

				$("#subimt-btn").hide();
				$("#loader").show();

				/* send register servlet */

				$.ajax({
					url : "registerServlet",
					type : 'post',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						$("#subimt-btn").show();
						$("#loader").hide();
						
						if(data.trim()=='done'){
							swal("Registered successfully..Please click ok to Login")
							.then((value) => {
							  window.location ="Login.jsp"
							});
						}else{
							swal(data);
						}
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						$("#subimt-btn").show();
						$("#loader").hide();
						swal("Something went wrong.. try again");
					},

					processData : false,
					contentType : false
				});
			})

		});
	</script>
</body>
</html>













