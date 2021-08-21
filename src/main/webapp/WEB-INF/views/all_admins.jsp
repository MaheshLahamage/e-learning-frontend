<%@ include file="header.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>Admin List</title>

</head>
<body>
	<div class="container jumbotron">
	<div class="panel-heading"><span class="lead">List of Admins</span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Admin Id</th>
                        <th>Username</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${admins}" var="admin">
                    <tr>
                        <td>${admin.admin_id}</td>
                        <td>${admin.name}</td>
                        <td>${admin.email}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
</body>
</html>