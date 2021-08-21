<%@ include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Dashboard</title>
</head>
<body>
	<div class="container jumbotron">
	    <div class="row justify-content-center">
            <div class="col-md-8">
			<h3>Welcome Admin ${admin.name}</h3>
			<hr>
		    <table>
		        <tr>
		            <td><h4>Your Profile</h4></td>
		        </tr>
		        <tr>
		        </tr>
		        <tr>
		        	<td>Admin Id: ${admin.admin_id}</td>
		        </tr>
		        <tr>
		        	<td>Phone No.: ${admin.name}</td>
		        </tr>
		        <tr>
		        	<td>Email : ${admin.email} </td>
		        </tr>
		    </table>
		    <div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">List of Users </span></div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Email</th>
                         
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.user_id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.address}</td>
                        <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                            <td><a href="<c:url value='/edit-user-${user.ssoId}' />" class="btn btn-success custom-width">edit</a></td>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMIN')">
                            <td><a href="<c:url value='/delete-user-${user.ssoId}' />" class="btn btn-danger custom-width">delete</a></td>
                        </sec:authorize>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <sec:authorize access="hasRole('ADMIN')">
            <div class="well">
                <a href="<c:url value='/newuser' />">Add New User</a>
            </div>
        </sec:authorize>
    </div>
		    </div>
	   </div>
   </div>
</body>
</html>