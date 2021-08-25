<%@ include file="header.jsp" %>
<%@ include file="login_req.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>

</head>
<body>
	<div class="container jumbotron">
	<div class="panel-heading"><span class="lead">All Users </span></div>
		<div class="table">
			    <div class="th">
                        <span class="td">User Id</span>
                        <span class="td">Username</span>
                        <span class="td">Phone No.</span>
                        <span class="td">Email</span>
                        <span class="td">Address</span>
                        <span class="td">Reg. Date</span>
                        <span class="td">Photo</span>
                        <span class="td"></span>
                        <span class="td"></span>
			    </div>
                <c:forEach items="${users}" var="user">
                    
			    	<div class="tr">
			    	
                         <span class="td">${user.user_id} </span>
                         <span class="td">${user.name} </span>
                         <span class="td">${user.phone_no} </span>
                         <span class="td">${user.email} </span>
                         <span class="td">${user.address} </span>
                         <span class="td">${user.reg_date} </span>
                         <span class="td">${user.upload_photo} </span>
                      	
                       	<form action="delUserProcess" method="Post" id="delform${user.user_id}">
							<input type="hidden" id="user_id${user.user_id}" name="user_id" value="${user.user_id}">
                        </form>
				        <span class="td">
	                        <button type="submit" form="delform${user.user_id}"class="btn btn-outline-danger">
	                        	Remove
	                        </button>
	                    </span>
                    </div>
                    
					<c:set var="i" value="${user.user_id}" />
                </c:forEach>
			</div>
			
	<div class="panel-heading"><span class="lead">Add User </span></div>
			<div class="formtable">
			    <form action="registrationProcess" method="Post" >
			    <div class="th">
                    <span class="td">User Id</span>
                    <span class="td">Username</span>
                    <span class="td">Phone No.</span>
                    <span class="td">Email</span>
                    <span class="td">Address</span>
			    </div>
			    <div class="tr">
			        <span class="td">${i+1}</span>
			        <span class="td"><input type="text" name="username"/></span>
			        <span class="td"><input type="text" name="phone"/></span>
			        <span class="td"><input type="email" name="email"/></span>
			        <span class="td"><input type="text" name="address"/></span>
		        </div>
			    <div class="th">
			        <span class="td"></span>
                    <span class="td">Reg. Date</span>
                    <span class="td">Photo</span>
                    <span class="td">Password</span>
			        <span class="td"></span>
			    </div>
			    
			    <div class="tr">
			        <span class="td"></span>
			        <span class="td"><input type="text" name="reg_date"/></span>
			        <span class="td"><input type="text" name="upload_photo"/></span>
			        <span class="td"><input type="password" name="password"/></span>
			        
			        <span class="td">
                        <button type="submit" class="btn btn-outline-primary">
                        Add
                        </button>
                    </span>
                </div>
			    </form>
		    </div>
		</div>
</body>