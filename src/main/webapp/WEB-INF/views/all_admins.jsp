<%@ include file="header.jsp" %>
<%@ include file="admin_login_req.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>Admin List</title>
<style>
.btn-primary{
	width: 70px;
	height: 40px;
	background-color: #7dadff;
	border: 1px solid #7dadff;
}
input{
	width: 200px;
	height: 38px;
}
</style>
</head>
<body>
	<div class="container jumbotron">
		<div class="panel-heading"><span class="lead">List of Admins</span></div>
			<div class="table">
			    <div class="th">
			        <span class="td">Admin Id</span>
			        <span class="td">Username</span>
			        <span class="td">Email</span>
			        <span class="td"></span>
			    </div>
                <c:forEach items="${admins}" var="admin">
                    
			    	<div class="tr">
                        <span class="td">${admin.admin_id}</span>
                        <span class="td">${admin.name}</span>
                      	<span class="td">${admin.email}</span>
				        <span class="td">
				        
							<input type="hidden" id="user_id" name="user_id" value="${auth.obj.user_id}">
	                        <button type="submit" form="form${admin.admin_id}"class="btn btn-outline-danger">
	                        	Remove
	                        </button>
	                    </span>
                    </div>
                    
					<c:set var="i" value="${admin.admin_id}" />
                </c:forEach>
			</div>
			<div class="table">
			    <div class="th">
			        <span class="td">Admin Id</span>
			        <span class="td">Username</span>
			        <span class="td">Email</span>
			        <span class="td">password</span>
			        <span class="td"></span>
			    </div>
			    <form class="tr" action="adminregistrationProcess" method="Post" modelAttribute="admin">
			        <span class="td">${i+1}</span>
			        <span class="td"><input type="text" name="username"/></span>
			        <span class="td"><input type="email" name="email"/></span>
			        <span class="td"><input type="password" name="password"/></span>
			        
			        <span class="td">
                        <button type="submit" class="btn btn-primary">
                        Add
                        </button>
                    </span>
			    </form>
		    </div>
        </div>
</body>
</html>
