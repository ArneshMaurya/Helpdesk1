<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Helpdesk -- New Account</title>

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
			<div style="width:47%;" class="center-block">
				<div class="card card-stats">
					<div class="card-header" data-background-color="purple">
						<i class="material-icons">person_add</i>
					</div>
					<div class="card-content">
						<h3 class="title">Create new Account</h3>
						<br>
					</div>
						<div class="card-content">
							<form method="GET" action="">
							<div class="form-group label-floating">
								<label class="control-label">Your Name</label>
								<input type="text" class="form-control" name="name">
							</div>
							<div class="form-group label-floating">
								<label class="control-label">Your Email</label>
								<input type="text" class="form-control" name="email">
							</div>
							<div class="form-group label-floating">
								<label class="control-label">Password</label>
								<input type="password" class="form-control" name="password">
							</div>
							<div class="form-group label-floating">
								<label class="control-label">Re-Type Password</label>
								<input type="password" class="form-control">
							</div>
							<div class="form-group label-floating">
								<label class="control-label">Security Question</label>
								<select class="form-control" name="ques">
									<option>Pet's Name?</option>
									<option>City's Name?</option>
									<option>Mother's Name?</option>
								</select>
							</div>
							<div class="form-group label-floating">
								<label class="control-label">Your Answer</label>
								<input type="text" class="form-control" name="ans">
							</div>
							<div class="form-group label-floating">
								<label class="control-label">User Id</label>
								<input type="text" class="form-control" name="uid">
							</div>
							<div>
								<input type="hidden" class="form-control" name="status" value="waiting">
							</div>
							<div class="form-group">
								<input type="submit" class="btn btn-primary" value="SIGNUP">
							</div>
							</form>
						</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons text-primary">navigate_before</i> <a href="index.jsp">Back to Login</a>
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
<%
try{
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/helpdesk","root","qwerty");
String query="insert into userdata values(?,?,?,?,?,?,?)";

PreparedStatement ps=con.prepareStatement(query);

ps.setString(1,request.getParameter("name"));
ps.setString(2,request.getParameter("email"));
ps.setString(3,request.getParameter("password"));
ps.setString(4,request.getParameter("ques"));
ps.setString(5,request.getParameter("ans"));
ps.setString(6,request.getParameter("uid"));
ps.setString(7,request.getParameter("status"));

if(request.getParameter("name")!=null)
   ps.executeUpdate();
con.close();

}
catch(Exception e)
{
	out.println(e);
}

%>

<script src="jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="bootstrap.min.js" type="text/javascript"></script>
<script src="material.min.js" type="text/javascript"></script>

</html>