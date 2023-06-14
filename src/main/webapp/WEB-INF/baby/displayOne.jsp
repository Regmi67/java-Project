<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html data-bs-theme="dark"><head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<div class="container">
<div class="row">
<div class= "text-end">
<a class="btn btn-warning" href="/" >Dashboard</a>
	<a class ="btn btn-danger" href="/users/logout">Logout</a>

</div>
</div>
<h1>${baby.newName}</h1>
<h1>(added by ${baby.userName.userName})</h1>
	<h5>Gender:<c:out value="${baby.gender}" /></h5>
	<h5>Origin: ${baby.origin}</h5>
	<h5>Meaning: <c:out value="${baby.meaning}"/></h5>
	
	
	<c:if test="${user_id == baby.userName.id}">
			 
			 
			 <span class="d-flex">
			
			 <a class="btn btn-success" href="/names/edit/${baby.id}">Edit</a> 
				
				
				</span>
			
			</c:if>
			 
			 
			
				
				
				
			
</div>
	
</body>
</html>