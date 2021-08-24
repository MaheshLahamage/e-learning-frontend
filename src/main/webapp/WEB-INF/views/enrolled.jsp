<%@ include file="header.jsp" %>
<%@ include file="login_req.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>Course List</title>
<style>
	.btn{
	  width: 100px;
	}
	.button {
	  width: 100px; /* set a width so it doesnt change upon hover */
	}
	
	.button:hover span {
	  display:none
	}
	
	.button:hover:before {
	  content:"Unenroll";
	}
	
	.button:hover {
    color: #db4f4f;
    background-color: #fff;
    border: 0.5px solid #db4f4f;
    background-image: none !important;
    box-shadow: none;
    box-shadow: inset 0 0 2rem rgba(219, 79, 79, .08);
  }
</style>
</head>
<body>
	<div class="container jumbotron">
		<div class="panel-heading"><span class="lead">Enrolled Courses</span></div>
	            <div class="table">
			    <div class="th">
	                        <span class="td">Course Id</span>
	                        <span class="td">Course Name</span>
	                        <span class="td">User Id</span>
	                        <span class="td">Username</span>
	                        <span class="td"></span>
	                        <span class="td"></span>
	               </div>
                <c:forEach items="${courses}" var="course" varStatus="status">
	                    <div class="tr">
	                        <span class="td">${course.course_id}</span>
	                        <span class="td">${course.c_name}</span>
	                        <span class="td">${users[status.index].user_id}</span>
	                        <span class="td">${users[status.index].name}</span>
		                        <form action="unenrollProcess" method="Post" id="form1${course.course_id}">
									<c:if test="${auth.roll == 'ADMIN'}">
										<input type="hidden" id="user_id" name="user_id"  value="${users[status.index].user_id}">
									</c:if>
									<c:if test="${auth.roll == 'USER'}">
										<input type="hidden" id="user_id" name="user_id" value="${auth.obj.user_id}">
									</c:if>
									<input type="hidden" id="course_id" name="course_id" value="${course.course_id}">
								</form>
							
	                        <span class="td"><button type="submit" form="form1${course.course_id}" class="btn btn-outline-success button"><span>Enrolled</span></button></span>
	                   </div>
	                </c:forEach>
	            </div>
	   </div>
</body>
