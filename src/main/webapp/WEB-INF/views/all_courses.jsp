<%@ include file="header.jsp" %>
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
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
</body>
