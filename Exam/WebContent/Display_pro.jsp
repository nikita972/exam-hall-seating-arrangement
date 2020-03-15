<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.examHall.*" %>
  <%@ page import="java.sql.Connection"%>
  <%@ page import="java.sql.PreparedStatement"%>
  <%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/bootstrap.css"/>
</head>
<body>
	<%! String reg_no,name,dob,address,branch,semister,photo,session_emailid,session_pass,dbpro_id;
	long mob_no,aadhaar_no;
	int i;%>
<%
	session_emailid=(String)session.getAttribute("emailid");
	session_pass=(String)session.getAttribute("password");
	Connection con1;
	PreparedStatement stmt;
	ResultSet rs;
	DBCon db1=new DBCon();
	con1=db1.dbCon();
	stmt=con1.prepareStatement("select * from reg_db where email_id=? AND password=?");
	stmt.setString(1,session_emailid);
	stmt.setString(2,session_pass);
	rs=stmt.executeQuery();
	while(rs.next())
	{
		dbpro_id=rs.getString(1);
		reg_no=rs.getString(2);
		name=rs.getString(3);
		dob=rs.getString(4);
		mob_no=rs.getLong(5);
		aadhaar_no=rs.getLong(6);
		
	}
	stmt=con1.prepareStatement("select * from update_pro where profile_id=?");
	stmt.setString(1,dbpro_id);
	rs=stmt.executeQuery();
	while(rs.next())
	{
		address=rs.getString(1);
		branch=rs.getString(2);
		semister=rs.getString(3);
		
	}
%>	
	<div id="nav" style="background-color:yellow">
<div class="container">
<div class="row" >
 <div class="pull-right">
	<ul class="nav navbar-nav" >
	
		<li><a href="Display_pro.jsp">Home</a></li>
		<li><a href="contact-us.jsp">Contact Us</a><li>
		<li><a href="search.jsp">Search</a><li>
		<li><a href="Logout">Logout</a><li>
	</ul>
	</div>
	</div>
</div>
</div>

<div class="container">
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-7">
			<form action="Display_pro.jsp" method="post">
			<center><h2 style="color:darkmagenta;">Profile Details</center><br/>
			<table  border="2" class="table" width="120%">
			<tr>
				<th width="40%"  style="padding:10px;">
				<span>Registration No:</span></th>
				<td width="60%" style="padding:10px;">
					<div class="update-box1"><%=reg_no%>
					</div>
				</td>
				
			</tr>
			<tr>
				<th style="padding:10px;"><span>Name:</span></th>
				<td style="padding:10px;">
					<div class="update-box1"><%=name%>
					</div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;"><span>Date Of Birth:</span></th>
				<td style="padding:10px;">
					<div class="update-box1"><%=dob%>
					</div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;"><span>Mobile Number:</span></th>
				<td style="padding:10px;">
					<div class="update-box1"><%=mob_no%>
					</div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;"><span>AAdhaar Number:</span></th>
				<td style="padding:10px;">
					<div class="update-box1"><%=aadhaar_no%>
					</div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;">Address:</th>
				<td><div class="update-box1"><%= address%></div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;">Branch:</th>
				<td><div class="update-box1"><%= branch%></div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;">Semister:</th>
				<td><div class="update-box1"><%=semister%></div>
				</td>
			</tr>
			</table>
			<a href="update-pro.jsp"><input type="button" value="Update Profile" class="update-delete-pro"></a>
			<a href="delete-pro.jsp"><input type="button" value="Delete Profile" class="update-delete-pro"></a>
			</form>
		</div>
		<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>