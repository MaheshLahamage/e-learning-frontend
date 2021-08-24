<%@ include file="header.jsp" %>
<%@ include file="login_req.jsp" %>
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