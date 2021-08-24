<%@ include file="header.jsp" %>
<%@ include file="admin_login_req.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>Admin List</title>
<style>
.btn-outline-primary{

	width: 70px;
	height: 40px;
}
.btn-outline-primary:hover{

	background-color: #61b8fa;
	border: 1px solid #7dadff;
}
.btn-outline-danger{
}
.btn-outline-danger:hover{

	background-color: #ff4d4d;
	border: 1px solid #fa2a2a;
}
input{
	width: 200px;
	height: 38px;
}
</style>
</head>
<body>
	<div class="container jumbotron">
		<div class="panel-heading"><span class="lead">All Admins</span></div>
			<div class="table">
			    <div class="th">
			        <span class="td">Admin Id</span>
			        <span class="td">Username</span>
			        <span class="td">Email</span>
			        <span class="td"></span>
			        <span class="td"></span>
			    </div>
                <c:forEach items="${admins}" var="admin">
                    
			    	<div class="tr">
                        <span class="td">${admin.admin_id}</span>
                        <span class="td">${admin.name}</span>
                      	<span class="td">${admin.email}</span>
                      	
                       	<form action="delAdminProcess" method="Post" id="delform${admin.admin_id}">
							<input type="hidden" id="admin_id${admin.admin_id}" name="admin_id" value="${admin.admin_id}">
                        </form>
				        <span class="td">
	                        <button type="submit" form="delform${admin.admin_id}"class="btn btn-outline-danger">
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
			        <span class="td">Password</span>
			        <span class="td"></span>
			    </div>
			    <form class="tr" action="adminregistrationProcess" method="Post">
			        <span class="td">${i+1}</span>
			        <span class="td"><input type="text" name="username"/></span>
			        <span class="td"><input type="email" name="email"/></span>
			        <span class="td"><input type="password" name="password"/></span>
			        
			        <span class="td">
                        <button type="submit" class="btn btn-outline-primary">
                        Add
                        </button>
                    </span>
			    </form>
		    </div>
        </div>
</body>
</html>
