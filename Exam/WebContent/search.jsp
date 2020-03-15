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
		<div class="col-md-7" style="background-color: aliceblue;margin-top:40px;">
			<form action="my-exam-hall.jsp" method="post">
				<h2 style="color:orange;margin-left:20%;">Search your seat</h2><br/>
				<div class="textbox-search">
				<span class="span-search">Enter Reg number:</span>
				<input type="text" name="rollno"><br/><br/>
				</div>
				<input type="submit" value="SEARCH" class="search-btn">
		</form>
		</div>
		</div>
		</div>	
		
	</body>
</html>