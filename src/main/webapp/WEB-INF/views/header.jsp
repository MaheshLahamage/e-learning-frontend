<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
   </head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="Home">Elerning</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	    <div class="navbar-nav">
			<a class="nav-item nav-link active" href="Home">Home <span class="sr-only">(current)</span></a>
				 
			<c:if test="${auth.roll != null}">
				<a class="nav-item nav-link" href="contacts">Contacts</a>
				<a class="nav-item nav-link" href="courses">Courses</a>
				<a class="nav-item nav-link" href="feedbacks">Feedbacks</a>
			</c:if>    
			<c:if test="${auth.roll == 'USER'}">
				<a class="nav-item nav-link" href="add_contact">Add Contact</a>
				<a class="nav-item nav-link" href="add_feedback">Add Feedback</a>
			</c:if> 
			<c:if test="${auth.roll == 'ADMIN'}">
				<a class="nav-item nav-link" href="add_course">Add Cource</a>
				<a class="nav-item nav-link" href="users">Users</a>
				<a class="nav-item nav-link" href="admins">Admins</a>
				<a class="nav-item nav-link" href="admin_registration">Admin Registration</a>
			</c:if>  
			<c:if test="${auth.roll == 'USER'}">
	    		<a class="nav-item" >User ${auth.username}</a>
	    		<a href="logout" class="nav-item btn btn-info btn-sm">
		          <span class="glyphicon glyphicon-log-out"></span> Log out
		        </a>
			</c:if>   
			<c:if test="${auth.roll == 'ADMIN'}">
	    		<a class="nav-item">Admin ${auth.username}</a>
	    		<a href="logout" class="nav-item btn btn-info btn-sm">
		          <span class="glyphicon glyphicon-log-out"></span> Log out
		        </a>
			</c:if>   
			<c:if test="${auth.roll == null}">
	    		<a class="nav-item nav-link" href="user_login">Log_in</a>
	    		<a class="nav-item nav-link" href="user_registration">Sign_up</a>
	    		<a class="nav-item nav-link" href="admin_login">Admin_Log_in</a>
			</c:if>   
	    </div>
	  </div>
	</nav>
</body>
</html>