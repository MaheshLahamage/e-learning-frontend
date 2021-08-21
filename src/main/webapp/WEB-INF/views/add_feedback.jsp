<%@ include file="header.jsp" %>
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
                                <div class="form-group row">
                                    <label for="id" class="col-md-4 col-form-label text-md-right">User ID</label>
                                    <div class="col-md-6">
                                        <input type="number" id="id" class="form-control" name="user_id">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="username" class="col-md-4 col-form-label text-md-right">Username</label>
                                    <div class="col-md-6">
                                        <input type="text" id="username" class="form-control" name="username">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail</label>
                                    <div class="col-md-6">
                                        <input type="email" id="email" class="form-control" name="email">
                                    </div>
                                </div>

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