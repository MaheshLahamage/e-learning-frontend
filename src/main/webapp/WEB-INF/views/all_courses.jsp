<%@ include file="header.jsp" %>
<%@ include file="login_req.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>Course List</title>

</head>
<body>
	<div class="container jumbotron">
	<div class="panel-heading"><span class="lead">List of Courses </span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Course Name</th>
                        <th>Fee</th>
                        <th>Descreption</th>
                        <th>Resources</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${courses}" var="course">
                    <tr>
                        <td>${course.course_id}</td>
                        <td>${course.c_name}</td>
                        <td>${course.c_fees}</td>
                        <td>${course.c_desp}</td>
                        <td>${course.c_resource}</td>
                        <td>
	                        <form action="enrollProcess" method="Post" id="form${course.course_id}">
								<c:if test="${auth.roll == 'ADMIN'}">
									<input type="number" id="user_id" name="user_id">
								</c:if>
								<c:if test="${auth.roll == 'USER'}">
									<input type="hidden" id="user_id" name="user_id" value="${auth.obj.user_id}">
								</c:if>
								<input type="hidden" id="course_id" name="course_id" value="${course.course_id}">
							</form>
						</td>
                        <td><button type="submit" form="form${course.course_id}" class="btn btn-outline-primary">Enroll</button></td>
                        <td><button type="button" class="btn btn-outline-success">Enrolled</button></td>
                        <td><button type="button" class="btn btn-outline-danger">Unenroll</button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
</body>
