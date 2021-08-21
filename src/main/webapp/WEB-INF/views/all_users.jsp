<%@ include file="header.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>

</head>
<body>
	<div class="container jumbotron">
	<div class="panel-heading"><span class="lead">List of Users </span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>User Id</th>
                        <th>Username</th>
                        <th>Phone No.</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Reg. Date</th>
                        <th>Photo</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.user_id}</td>
                        <td>${user.name}</td>
                        <td>${user.phone_no}</td>
                        <td>${user.email}</td>
                        <td>${user.address}</td>
                        <td>${user.reg_date}</td>
                        <td>${user.upload_photo}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
	</div>
</body>
</html>