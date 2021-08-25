<%@ include file="header.jsp" %>
<%@ include file="login_req.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>Contacts</title>

</head>
<body>
	<div class="container jumbotron">
	<div class="panel-heading"><span class="lead">All Contacts</span></div>
           <div class="table">
			    <div class="th">
                        <span class="td">Id</span>
                        <span class="td">User Id</span>
                        <span class="td">Username</span>
                        <span class="td">Phone No.</span>
                        <span class="td">Email</span>
                        <span class="td">Message</span>
                        <span class="td"></span>
                        <span class="td"></span>
                 </div>
				<c:if test="${auth.roll == 'USER'}">
					<c:set var="Cont" scope="session" value="${contacts.stream().filter(c -> c.name == auth.username).toList()}"/>  
				</c:if>
				<c:if test="${auth.roll == 'ADMIN'}">
					<c:set var="Cont" scope="session" value="${contacts}"/>  
				</c:if>
	                <c:forEach items="${Cont}" var="contact">
	                    <div class="tr">
	                        <span class="td">${contact.contact_id}</span>
	                        <span class="td">${contact.user_id}</span>
	                        <span class="td">${contact.name}</span>
	                        <span class="td">${contact.phone_no}</span>
	                        <span class="td">${contact.email}</span>
	                        <span class="td">${contact.message}</span>
	                        
	                       	<form action="delContactProcess" method="Post" id="delform${contact.contact_id}">
								<input type="hidden" id="contact_id${contact.contact_id}" name="contact_id" value="${contact.contact_id}">
	                        </form>
					        <span class="td">
		                        <button type="submit" form="delform${contact.contact_id}"class="btn btn-outline-danger">
		                        	Remove
		                        </button>
		                    </span>
	                    </div>
					<c:set var="i" value="${contact.contact_id}" />
	                </c:forEach>
                </div>
                
			<div class="panel-heading"><span class="lead">Add Contact </span></div>
			<div class="table">
			    <form name="my-form" action="submit_contact" method="Post">
			    <div class="th">
                    <span class="td">Contact Id</span>
                    <span class="td">User Id</span>
                    <span class="td">Username</span>
                    <span class="td">Phone No.</span>
                    <span class="td">Email</span>
                    <span class="td">Message</span>
                    <span class="td"></span>
			    </div>
			    <div class="tr">
			        <span class="td">${i+1}</span>
    				<c:if test="${auth.roll == 'USER'}">
                       	<input type="hidden" id="user_id" name="user_id"  value="${auth.obj.user_id }">
                       	<input type="hidden" id="username" name="username" value="${auth.obj.name }">
				        <span class="td">${auth.obj.user_id }</span>
				        <span class="td">${auth.obj.name }</span>
                    </c:if>
                    <c:if test="${auth.roll == 'ADMIN'}">
        				<span class="td"><input type="number" name="user_id"/></span>
       					<span class="td"><input type="text" name="username"/></span>
                    </c:if>
			        <span class="td"><input type="text" name="phone"/></span>
			        <span class="td"><input type="email" name="email"/></span>
			        <span class="td"><input type="text" name="message"/></span>
		        
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