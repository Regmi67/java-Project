<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark"><head>
<<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>Edit ${baby.newName}</h1>
<div class="text-end">
	<a class ="btn btn-primary" href="/">Dashboard</a>
	<a class ="btn btn-danger" href="/users/logout">Logout</a>
	
	
</div>
    <form:form action="/names/process/edit/${baby.id}" modelAttribute="baby" method="post">
        <input type="hidden" name="_method" value="put"/>
        <form:hidden path="userName"/>
        <div>
            <form:label path="newName" >  New Name</form:label>
            <form:input type="text" path="newName"/>
            <form:errors path="newName"/>
        </div>
        <br/>
        <div>
            <form:label path="gender" > Gender </form:label>
              <form:select  path="gender">
   			 <form:option value="male"> Male</form:option>
   			 <form:option value="female"> Female</form:option>
   			 <form:option value="neutral"> Neutral</form:option>
   			    			 
   			 
    		<%-- <form:options items="${gender}"></form:options> --%>
 			 </form:select>
            <form:errors path="gender"/>
        </div>
         <br/>
        <div>
            <form:label path="origin" > Origin </form:label>
            <form:input type="text" path="origin"/>
            <form:errors path="origin"/>
        </div>
        
        
         <div>
            <form:label path="meaning" > Meaning </form:label>
            <form:input type="text" path="meaning"/>
            <form:errors path="meaning"/>
        </div>
        
        <input class="btn btn-primary" type="submit" value="Update "/>
        </form:form>
        
        </div>
</body>
</html>