<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1 class= "text-success">Hello, ${loggedInUser.userName }.Here are some name suggestion</h1>
	<div class = "text-end">
	<a class ="btn btn-danger"  href="/users/logout">Logout</a>
	
</div>
	
	<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Name</th>
      <th scope="col">Gender</th>
      <th scope="col">Origin</th>
      
      <th scope="col">Action </th>
      
     
    </tr>
  </thead> 
  <tbody> 
   <c:forEach items="${allBabys}" var="baby">
    <tr>
			<td>${baby.id}</td>
			<td><a href="/names/${baby.id}">${baby.newName}</a></td>
			<td>${baby.gender}</td>
			<td>${baby.origin}</td>
			
			
			<c:if test="${user_id == baby.userName.id}">
			 
			 <td>
			 <span class="d-flex">
			
			 <a class="btn btn-outline-warning" href="/names/edit/${baby.id}">Edit</a> 
				<form action="/names/delete/${baby.id}" method="post">
				
					<input type="hidden" value="delete" name="_method"/>
					<input class="btn btn-outline-danger" type="submit" value="delete"/>
				
				</form>
				
				</span>
			</td> 
			</c:if>
			<c:if test="${user_id != baby.userName.id}">
			
			<td><a href="/names/${baby.id}">View</a></td>
			</c:if>
    </tr>
	</c:forEach> 
  </tbody>
</table>  
<a class = "btn btn-primary" href="/names/create"> new name</a>
</div>
</body>
</html>