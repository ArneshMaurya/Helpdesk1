<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forgot Password -- Helpdesk</title>

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
	<div class="container">
		<div style="width: 47%;" class="center-block">
			<div class="card card-stats">
				<div class="card-header" data-background-color="purple">
					<i class="material-icons">person_add</i>
				</div>
				<div class="card-content">
					<h3 class="title">Forgot Password</h3>
					<br>
				</div>
				<div class="card-content">
					<form method="POST" action="">
						<%
							int err_code = -1;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/helpdesk","root","qwerty");
                                                        if (request.getParameter("name") != null && request.getParameter("btn_change") != null) {
								String check = "select ans from userdata where uid=?";
								PreparedStatement ps = conn.prepareStatement(check);
								ps.setString(1, request.getParameter("name"));
								ResultSet r = ps.executeQuery();
								String query = "update userdata set upass=? where uid=?";
								if (r.next()) {
									if (r.getString(1).equals(request.getParameter("ans"))) {
										if (request.getParameter("n_pass").equals(request.getParameter("r_pass"))) {
											PreparedStatement p = conn.prepareStatement(query);
											p.setString(1, request.getParameter("n_pass"));
											p.setString(2, request.getParameter("name"));
											p.executeUpdate();
											err_code = 0;
										} else {
											err_code = 1;
										}
									} else {
										err_code = 2;
									}
								}
							}
							if (request.getParameter("name") != null && request.getParameter("btn_check") != null) {
								String query = "select ques from userdata where uid=?";
								PreparedStatement ps = conn.prepareStatement(query);
								ps.setString(1, request.getParameter("name"));
								ResultSet r = ps.executeQuery();
								if (r.next()) {
						%>
						<div class="form-group label-floating">
							<label class="control-label">User Id</label> <input type="text"
								class="form-control" name="name"
								value="<%out.println(request.getParameter("name"));%>">
						</div>
						<div class="form-group label-floating">
							<label class="control-label">Question</label> <input type="text"
								class="form-control" value="<%out.println(r.getString(1));%>">
						</div>
						<div class="form-group label-floating">
							<label class="control-label">Your Answer</label> <input
								type="text" class="form-control" name="ans">
						</div>
						<div class="form-group label-floating">
							<label class="control-label">New Password</label> <input
								type="text" class="form-control" name="n_pass">
						</div>
						<div class="form-group label-floating">
							<label class="control-label">Re type Password</label> <input
								type="text" class="form-control" name="r_pass">
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Change"
								name="btn_change">
						</div>
						<%
							} else {
						%>
						<div class="form-group label-floating">
							<label class="control-label">User Id</label> <input type="text"
								class="form-control" name="name">
							<%
								request.getParameter("name");
							%>
						</div>
						<b class="text-danger">No Such ID Exists!</b>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Check"
								name="btn_check">
						</div>

						<%
							}
						%>

						<%
							} else {
						%>
						<div class="form-group label-floating">
							<label class="control-label">User Id</label> <input type="text"
								class="form-control" name="name">
						</div>
						<%
							switch (err_code) {
								case 0:
						%><b class="text-success">
							<%
								out.println("Password Changed");
										break;
									case 1:
							%><b class="text-danger">
								<%
									out.println("Password do not match!");
											break;
										case 2:
								%><b class="text-danger">
									<%
										out.println("Wrong Answer");
												break;
											default:
												out.println("");
											}
									%>
							</b>
								<div class="form-group">
									<input type="submit" class="btn btn-primary" value="Check"
										name="btn_check">
								</div> <%
 	}
 	conn.close();
 %>
						
					</form>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons text-primary">navigate_before</i> <a
							href="index.jsp">Back to Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="bootstrap.min.js" type="text/javascript"></script>
<script src="material.min.js" type="text/javascript"></script>

</html>