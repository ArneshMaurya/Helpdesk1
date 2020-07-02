<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Administrator -- Login</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />

<link rel="icon" type="image/png" href="favicon.png" />
<link href="bootstrap.min.css" rel="stylesheet" />
<link href="material-dashboard.css" rel="stylesheet"/>

<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>

<body>
	<nav class="navbar navbar-primary" role="navigation">
		<div class="container">
	    	<div class="navbar-header">
	    		<image src="xing-logo.png" class="navbar-brand"></image>
	    	</div>
	   	</div>
	</nav>
	<div class="container">
			<div style="width:37%; margin-top:50px;" class="center-block">
				<div class="card card-stats">
					<div class="card-header" data-background-color="red">
						<i class="material-icons">person</i>
					</div>
					<div class="card-content">
						<h3 class="title">Login As Administrator</h3>
						<br>
					</div>
						<div class="card-content">
							<div class="form-group label-floating">
								<label class="control-label">User Id</label>
								<input type="text" class="form-control">
							</div>
							<div class="form-group label-floating">
								<label class="control-label">Password</label>
								<input type="password" class="form-control">
							</div>
							<div class="form-group">
								<input type="submit" class="btn btn-danger" value="LOGIN">
							</div>
						</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons text-danger">help</i> <a href="#pablo">Forgot Password?</a>
						</div>
						<div class="stats pull-right">
							<i class="material-icons text-success">add</i> <a href="newaccount.jsp">Create new Account</a>
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
<%


%>
<script src="jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="bootstrap.min.js" type="text/javascript"></script>
<script src="material.min.js" type="text/javascript"></script>

</html>