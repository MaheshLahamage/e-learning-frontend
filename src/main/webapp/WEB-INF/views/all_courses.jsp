<%@ include file="header.jsp" %>
<%@ include file="login_req.jsp" %>
<head>
<meta charset="ISO-8859-1">
<title>Course List</title>
<style>
	.btn{
	  width: 100px;
	}
	.button {
	  width: 100px; /* set a width so it doesnt change upon hover */
	}
	
	.button:hover span {
	  display:none
	}
	
	.button:hover:before {
	  content:"Unenroll";
	}
	
	.button:hover {
    color: #db4f4f;
    background-color: #fff;
    border: 0.5px solid #db4f4f;
    background-image: none !important;
    box-shadow: none;
    box-shadow: inset 0 0 2rem rgba(219, 79, 79, .08);
  }
</style>
</head>
<body>
	<div class="container jumbotron">
		<div class="panel-heading"><span class="lead">Enrolled Courses</span></div>
	            <table class="table table-hover">
	                <thead>
	                    <tr>
	                        <th>Id</th>
	                        <th>Course Name</th>
	                        <th>Fee</th>
	                        <th>Descreption</th>
	                        <th>Resources</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <c:forEach items="${enrolled}" var="course">
	                    <tr>
	                        <td>${course.course_id}</td>
	                        <td>${course.c_name}</td>
	                        <td>${course.c_fees}</td>
	                        <td>${course.c_desp}</td>
	                        <td>${course.c_resource}</td>
	                        <td>
		                        <form action="courseunenrollProcess" method="Post" id="form1${course.course_id}">
									<c:if test="${auth.roll == 'ADMIN'}">
										<input type="number" id="user_id" name="user_id">
									</c:if>
									<c:if test="${auth.roll == 'USER'}">
										<input type="hidden" id="user_id" name="user_id" value="${auth.obj.user_id}">
									</c:if>
									<input type="hidden" id="course_id" name="course_id" value="${course.course_id}">
								</form>
							</td>
							
	                        <td><button type="submit" form="form1${course.course_id}" class="btn btn-outline-success button"><span>Enrolled</span></button></td>
	                    </tr>
	                </c:forEach>
	                </tbody>
	            </table>
		<div class="panel-heading"><span class="lead">List of Courses </span></div>
	            <table class="table table-hover">
	                <thead>
	                    <tr>
	                        <th>Id</th>
	                        <th>Course Name</th>
	                        <th>Fee</th>
	                        <th>Descreption</th>
	                        <th>Resources</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <c:forEach items="${courses}" var="course">
	                    <tr>
	                        <td>${course.course_id}</td>
	                        <td>${course.c_name}</td>
	                        <td>${course.c_fees}</td>
	                        <td>${course.c_desp}</td>
	                        <td>${course.c_resource}</td>
	                        <td>
		                        <form action="courseenrollProcess" method="Post" id="form${course.course_id}">
									<c:if test="${auth.roll == 'ADMIN'}">
										<input type="number" id="user_id" name="user_id">
									</c:if>
									<c:if test="${auth.roll == 'USER'}">
										<input type="hidden" id="user_id" name="user_id" value="${auth.obj.user_id}">
									</c:if>
									<input type="hidden" id="course_id" name="course_id" value="${course.course_id}">
								</form>
							</td>
	                        <td><button type="submit" form="form${course.course_id}" class="btn btn-outline-primary">Enroll</button></td>
	                    </tr>
	                </c:forEach>
	                </tbody>
	            </table>
	            
                        <div class="card-header"><h4>Add Course</h4></div>
                        <div class="card-body">
                            <form name="my-form" action="submit_course" method="Post" >
                                
                                <div class="form-group row">
                                    <label for="c_name" class="col-md-4 col-form-label text-md-right">Course Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="c_name" class="form-control" name="c_name">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="c_fees" class="col-md-4 col-form-label text-md-right">Course Fee</label>
                                    <div class="col-md-6">
                                        <input type="number" step="0.01" id="c_fees" class="form-control" name="c_fees">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="c_desp" class="col-md-4 col-form-label text-md-right">Description</label>
                                    <div class="col-md-6">
                                        <input type="text" id="c_desp" class="form-control" name="c_desp">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="c_resource" class="col-md-4 col-form-label text-md-right">Resources</label>
                                    <div class="col-md-6">
                                        <input type="text" id="c_resource" class="form-control" name="c_resource">
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
</body>
