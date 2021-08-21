<%@ include file="header.jsp" %>
<html>
<head>
	<title>Admin Registration Page</title>
</head>
<body>

<hr>
	<div class="container jumbotron">
	    <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header"><h4>Register Here</h4></div>
                        <div class="card-body">
                            <form name="my-form" action="adminregistrationProcess" method="Post" modelAttribute="admin">
                                
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
                                    <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="password" id="password" class="form-control" name="password">
                                    </div>
                                </div>

                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                    Register
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                 </div>
            </div>
         </div>

</body>
</html>