<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1 class= "text-danger">Joy Bundler Names</h1>	
		<div class="row">
			<div class="col">
				<h1>Register</h1>
				<br/>
				<form:form action="/users/process/register" method="post" modelAttribute="newUser">
				    <div class="form-group">
				        <label> Name</label>
				        <form:input path="userName" class="form-control" />
				        <form:errors path="userName" class="text-danger" />
				    </div>
				    
				    <div class="form-group">
				        <label>Email</label>
				        <form:input path="email" class="form-control" />
				        <form:errors path="email" class="text-danger" />
				    </div>
				    <div class="form-group">
				        <label>Password</label>
				        <form:input path="password" class="form-control" />
				        <form:errors path="password" class="text-danger" />
				    </div>
				    <div class="form-group">
				        <label>Confirm Password</label>
				        <form:input path="confirm" class="form-control" />
				        <form:errors path="confirm" class="text-danger" />
				    </div>
				    <br/>
				    <input type="submit" value="Register " class="btn btn-primary" />
				</form:form>
			</div>
			<div class="col">
			<h1>Log In</h1>
			<br/>
			<form:form action="/users/process/login" method="post" modelAttribute="loginUser">
				    <form:errors path="email" class="text-danger" />
				    <div class="form-group">
				        <label>Email</label>
				        <form:input path="email" class="form-control" />
				    </div>
				    <div class="form-group">
				        <label>Password</label>
				        <form:input path="password" class="form-control" />
				        <form:errors path="password" class="text-danger" />
				    </div>
				    <br/>

				    <input type="submit" value="Login" class="btn btn-primary" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>