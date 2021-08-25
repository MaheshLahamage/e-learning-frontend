<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
DIV.formtable 
{
	
    width: 1000px;
    margin: 25px 60px;
}
DIV.table 
{
    display:table;
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
DIV.th{
    display:table-row;
    background-color: #c9ddff;
    
    text-align: left;
    border-bottom: 1px solid #dddddd;
}
FORM.tr, DIV.tr
{
    display:table-row;
    background-color: #dce8fc;
    
    text-align: left;
    border-bottom: 1px solid #dddddd;
}
FORM.tr, DIV.tr:nth-of-type(even) {
    background-color: #e8effa;
}

SPAN.td
{
    display:table-cell;
    padding: 12px 15px;
}
.navbar{
	background-image: linear-gradient(to left bottom, #d3d4f5, #c2c7f7, #b0baf9, #9baefb, #82a3fd);
    
}
.user{
	margin: 0 30px;
}
.admin{
	margin: 0 30px;
}
.btn-info{
	background-image: linear-gradient(to right, #7074f0, #707ef2, #7288f4, #7692f5, #7b9bf5);
	border: 0 ;
}
.container{
	background-image: linear-gradient(to left bottom, #d3d4f5, #d0d4f8, #ccd3fa, #c8d3fd, #c3d3ff);
	margin-top: 30px;
}
.card-header{
	background-image: linear-gradient(to right top, #987aef, #a58ff4, #b3a3f8, #c1b7fb, #d1cbfd);
}
.card-body{
	background-image: linear-gradient(to right top, #b299f9, #b9a6fb, #c0b2fc, #c8bffd, #d1cbfd);
}
.btn-primary{
	background-image: linear-gradient(to right top, #8258f8, #8a6bf9, #937cf8, #9d8df7, #a89df5);
	border: 0 ;
	width: 100px;
}
</style>	
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="Home">Elerning</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	    <div class="navbar-nav ">
			<a class="nav-item nav-link active" href="Home">Home <span class="sr-only">(current)</span></a>
				 
			<c:if test="${auth.roll != null}">
				<a class="nav-item nav-link" href="contacts">Contacts</a>
				<a class="nav-item nav-link" href="courses">Courses</a>
				<a class="nav-item nav-link" href="feedbacks">Feedbacks</a>
			</c:if>    
			<c:if test="${auth.roll == 'USER'}">
			</c:if> 
			<c:if test="${auth.roll == 'ADMIN'}">
				<a class="nav-item nav-link" href="enrolled">Enrolled</a>
				<a class="nav-item nav-link" href="users">Users</a>
				<a class="nav-item nav-link" href="admins">Admins</a>
			</c:if>  
			</div>
			<div class="navbar-nav ml-auto">
			<c:if test="${auth.roll == 'USER'}">
	    		<a class="nav-item user" >User ${auth.username}</a>
	    		<a href="logout"></a>
	    		<a href="logout" class="nav-item btn btn-info">
		          <i class="icon-off"></i> Logout
		        </a>
			</c:if>   
			<c:if test="${auth.roll == 'ADMIN'}">
	    		<a class="nav-item admin">Admin ${auth.username}</a>
	    		<a href="logout" class="nav-item btn btn-info">
		          <i class="icon-off"></i> Logout
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