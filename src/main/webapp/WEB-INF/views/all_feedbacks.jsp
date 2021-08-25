<%@ include file="header.jsp" %>
<%@ include file="login_req.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>Feedback List</title>

<style>
</style>
</head>
<body>
	<div class="container jumbotron">
	<div class="panel-heading"><span class="lead">List of Feedbacks </span></div>
                 <div class="table">
			    <div class="th">
                        <span class="td">Id</span>
                        <span class="td">User Id</span>
                        <span class="td">Username</span>
                        <span class="td">Email</span>
                        <span class="td">Feedback</span>
						<c:if test="${auth.roll == 'ADMIN'}">
                        <span class="td"></span>
                        <span class="td"></span>
						</c:if>
                    </div>
                <c:forEach items="${feedbacks}" var="feedback">
                    <div class="tr">
                        <span class="td">${feedback.f_id}</span>
                        <span class="td">${feedback.user_id}</span>
                        <span class="td">${feedback.name}</span>
                        <span class="td">${feedback.email}</span>
                        <span class="td">${feedback.feedback}</span>
                        
						<c:if test="${auth.roll == 'ADMIN'}">
	                       	<form action="delFeedbackProcess" method="Post" id="delform${feedback.f_id}">
								<input type="hidden" id="f_id${feedback.f_id}" name="f_id" value="${feedback.f_id}">
	                        </form>
					        <span class="td">
		                        <button type="submit" form="delform${feedback.f_id}"class="btn btn-outline-danger">
		                        	Remove
		                        </button>
		                    </span>
	                    </c:if>
                    </div>
                </c:forEach>
                </div>   
			<c:if test="${auth.roll == 'USER'}">
                <div class="card-header"><h4>Add Feedback</h4></div>
                <div class="card-body">
                    <form name="my-form" action="submit_feedback" method="Post" >
                    
                        	<input type="hidden" id="user_id" name="user_id"  value="${auth.obj.user_id }">
                         <input type="hidden" id="username" name="username" value="${auth.obj.name }">
                         <input type="hidden" id="email" name="email" value="${auth.obj.email }">
                    	

                        <div class="form-group row">
                            <label for="feedback" class="col-md-4 col-form-label text-md-right">Feedback</label>
                            <div class="col-md-6">
                                <input type="text" id="feedback" class="form-control" name="feedback">
                            </div>
                        </div>
                        <div class="col-md-6 offset-md-4">
                            <button type="submit" class="btn btn-primary">
                            Submit Feedback
                            </button>
                        </div>
                    </form>
                </div>
             </c:if>
        </div>
</body>
</html>