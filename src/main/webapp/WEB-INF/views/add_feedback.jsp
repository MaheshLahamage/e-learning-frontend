<%@ include file="header.jsp" %>
<%@ include file="login_req.jsp" %>
<html>
<head>
	<title>Feedback Page</title>
</head>
<body>

<hr>
	<div class="container jumbotron">
	    <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
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
                    </div>
                 </div>
            </div>
         </div>



//JSTL Core Tag Library
</body>
</html>