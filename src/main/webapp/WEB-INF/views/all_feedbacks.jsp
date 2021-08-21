<%@ include file="header.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>Feedback List</title>

</head>
<body>
	<div class="container jumbotron">
	<div class="panel-heading"><span class="lead">List of Feedbacks </span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>User Id</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Feedback</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${feedbacks}" var="feedback">
                    <tr>
                        <td>${feedback.f_id}</td>
                        <td>${feedback.user_id}</td>
                        <td>${feedback.name}</td>
                        <td>${feedback.email}</td>
                        <td>${feedback.feedback}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
	</div>
</body>
</html>