<%@ include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Dashboard</title>
</head>
<body>
	<div class="container jumbotron">
	    <div class="row justify-content-center">
            <div class="col-md-8">
			<h3>Welcome Admin ${admin.name}</h3>
			<hr>
		    <table>
		        <tr>
		            <td><h4>Your Profile</h4></td>
		        </tr>
		        <tr>
		        </tr>
		        <tr>
		        	<td>Admin Id: ${admin.admin_id}</td>
		        </tr>
		        <tr>
		        	<td>Phone No.: ${admin.name}</td>
		        </tr>
		        <tr>
		        	<td>Email : ${admin.email} </td>
		        </tr>
		    </table>
		    </div>
	   </div>
   </div>
</body>
</html>