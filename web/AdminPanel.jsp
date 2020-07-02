<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Helpdesk -- Admin Panel</title>
<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("index.jsp");
	}
	else
	{
		if(session.getAttribute("type")!=null)
		{
			if(session.getAttribute("type").equals("user"))
				response.sendRedirect("UserPanel.jsp");
		}
	}
%>
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
	<div style="background-color: #ffffff;margin-bottom: 20px;">
		<div class="container">
		<h3 class="pull-left" style="margin-top: 10px;">Hello <%=session.getAttribute("username") %></h3>
		<form method="link" action="logout.jsp"><input type="submit" class="btn btn-primary pull-right" value="LOGOUT"></form>
		</div>
	</div>
	<div class="container">
		<div class="card">
			<div class="card-header" data-background-color="purple">
				<h4 class="title">User Requests</h4>
				<p class="category">Accept or Reject the requests</p>
			</div>

			<div class="card-content table-responsive">
				<table class="table">
					<thead class="text-danger">
						<th>User Id</th>
						<th>Name</th>
						<th>Email</th>
						<th>Status</th>
						<th>Change Status</th>
					</thead>
					<tbody>
						<%
							  Class.forName("org.apache.derby.jdbc.ClientDriver");  
                                                          Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/helpdesk","root","qwerty");    
            
							String update="update userdata set status='"+request.getParameter("status")+"' where uid='"+request.getParameter("name")+"'";
							PreparedStatement up=con.prepareStatement(update);
							try{
							up.executeUpdate();
							}
							catch(Exception e)
							{
								out.println(e);
							}

							String query = "select uid,uname,email,status from userdata";
							PreparedStatement st = con.prepareStatement(query);

							ResultSet r = st.executeQuery();
							while (r.next()) {
						%>
						<tr>
							<td><%=r.getString(1)%></td>
							<td><%=r.getString(2)%></td>
							<td><%=r.getString(3)%></td>
							<%
								if (r.getString(4).equals("accepted")) {
							%>
							<td class="text-success text-capitalize"><%=r.getString(4)%></td>
							<%
								} else if (r.getString(4).equals("declined")) {
							%>
							<td class="text-danger text-capitalize"><%=r.getString(4)%></td>
							<%
								} else {
							%>
							<td class="text-warning text-capitalize"><%=r.getString(4)%></td>
							<%
								}
							%>
							<td><a
								href="AdminPanel.jsp?name=<%=r.getString(1)%>&status=accepted"
								class="btn btn-success">Accept</a> <a
								href="AdminPanel.jsp?name=<%=r.getString(1)%>&status=declined"
								class="btn btn-danger">Decline</a></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<%
con.close();
%>
</body>

<script src="jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="bootstrap.min.js" type="text/javascript"></script>
<script src="material.min.js" type="text/javascript"></script>

</html>