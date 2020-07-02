<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%
if(session.getAttribute("type")!=null)
{
if(session.getAttribute("type").equals("admin"))
{
	response.sendRedirect("AdminPanel.jsp");
}
else if(session.getAttribute("type").equals("user"))
{
	response.sendRedirect("UserPanel.jsp");
}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Helpdesk -- Login</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<link rel="icon" type="image/png" href="favicon.png" />
<link href="bootstrap.min.css" rel="stylesheet" />
<link href="material-dashboard.css" rel="stylesheet" />

<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
</head>

<body>
	<nav class="navbar navbar-primary" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<image src="xing-logo.png" class="navbar-brand"></image>
		</div>
	</div>
	</nav>
	<div class="container" style="margin-top: 7%;">
		<div class="col-md-5 pull-left">
			<div class="card card-stats">
				<div class="card-header" data-background-color="purple">
					<i class="material-icons">person</i>
				</div>
				<div class="card-content">
					<h3 class="title">Login into your Account</h3>
					<br>
				</div>
				<div class="card-content">
					<form method="POST" action="">
						<div class="form-group label-floating">
							<label class="control-label">User Id</label> <input type="text"
								class="form-control" name="lg_id">
						</div>
						<div class="form-group label-floating">
							<label class="control-label">Password</label> <input
								type="password" class="form-control" name="lg_pass">
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="LOGIN">
						</div>
					</form>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons text-danger">help</i> <a
							href="forgotPassword.jsp">Forgot Password?</a>
					</div>
					<div class="stats pull-right">
						<i class="material-icons text-success">add</i> <a
							href="newaccount.jsp">Create new Account</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-5 pull-right">
			<div class="card card-stats">
				<div class="card-header" data-background-color="red">
					<i class="material-icons">chrome_reader_mode</i>
				</div>
				<div class="card-content">
					<h3 class="title">Administrator Login</h3>
					<br>
				</div>
				<div class="card-content">
					<form method="POST" action="">
						<div class="form-group label-floating">
							<label class="control-label">User Id</label> <input type="text"
								class="form-control" name="ad_id">
						</div>
						<div class="form-group label-floating">
							<label class="control-label">Password</label> <input
								type="password" class="form-control" name="ad_pass">
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-danger" value="LOGIN">
						</div>
					</form>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons text-primary">help</i> <a href="">Help!</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%
	    Class.forName("org.apache.derby.jdbc.ClientDriver");  
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/helpdesk","root","qwerty");      
            String query = "select * from userdata where uid=?";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, request.getParameter("lg_id"));

	if (request.getParameter("lg_id") != null) {
		ResultSet r = ps.executeQuery();
		if (r.next()) {
			if (r.getString(3).equals(request.getParameter("lg_pass"))) {
				if (r.getString(7).equals("waiting")) {
%>
<div class="alert alert-warning col-md-3"
	style="position: absolute; margin-left: 2%; bottom: 0px;">
	<div class="container-fluid">
		<div class="alert-icon">
			<i class="material-icons">warning</i>
		</div>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true"><i class="material-icons">clear</i></span>
		</button>
		<b>Alert: ID NOT YET CONFIRMED.</b>
	</div>
</div>
<%
	} else if (r.getString(7).equals("declined")) {
%>
<div class="alert alert-danger col-md-3"
	style="position: absolute; margin-left: 2%; bottom: 0px;">
	<div class="container-fluid">
		<div class="alert-icon">
			<i class="material-icons">warning</i>
		</div>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true"><i class="material-icons">clear</i></span>
		</button>
		<b>Alert: Declined. CONTACT ADMINISTRATOR.</b>
	</div>
</div>

<%
	} else {
		session.setAttribute("username", request.getParameter("lg_id"));
		session.setAttribute("type","user");
		response.sendRedirect("UserPanel.jsp");
				}
			} else {
%>
<div class="alert alert-danger col-md-3"
	style="position: absolute; margin-left: 2%; bottom: 0px;">
	<div class="container-fluid">
		<div class="alert-icon">
			<i class="material-icons">error_outline</i>
		</div>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true"><i class="material-icons">clear</i></span>
		</button>
		<b>ERROR: WRONG PASSWORD!!</b>
	</div>
</div>
<%
	}
		} else {
%>
<div class="alert alert-info col-md-3"
	style="position: absolute; margin-left: 2%; bottom: 0px;">
	<div class="container-fluid">
		<div class="alert-icon">
			<i class="material-icons">error_outline</i>
		</div>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true"><i class="material-icons">clear</i></span>
		</button>
		<b>Error Alert: NO SUCH ID EXISTS!!</b>
	</div>
</div>
<%
	}
	}
	if (request.getParameter("ad_id") != null) {
		String ad_query = "select * from admin where Username=?";
		PreparedStatement ad_ps = con.prepareStatement(ad_query);
		ad_ps.setString(1, request.getParameter("ad_id"));
		ResultSet r = ad_ps.executeQuery();
		if (r.next()) {
			if (r.getString(2).equals(request.getParameter("ad_pass"))) {
				session.setAttribute("username", request.getParameter("ad_id"));
				session.setAttribute("type","admin");
				response.sendRedirect("AdminPanel.jsp");
			} else {
%>
<div class="alert alert-danger col-md-3"
	style="position: absolute; margin-left: 2%; bottom: 0px;">
	<div class="container-fluid">
		<div class="alert-icon">
			<i class="material-icons">error_outline</i>
		</div>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true"><i class="material-icons">clear</i></span>
		</button>
		<b>ERROR: WRONG PASSWORD!!</b>
	</div>
</div>
<%
	}
		} else {
%>
<div class="alert alert-info col-md-3"
	style="position: absolute; margin-left: 2%; bottom: 0px;">
	<div class="container-fluid">
		<div class="alert-icon">
			<i class="material-icons">error_outline</i>
		</div>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true"><i class="material-icons">clear</i></span>
		</button>
		<b>Error Alert: NO SUCH ID EXISTS!!</b>
	</div>
</div>
<%
	}
	}
	con.close();
%>

<script src="jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="bootstrap.min.js" type="text/javascript"></script>
<script src="material.min.js" type="text/javascript"></script>
</html>
