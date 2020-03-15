<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.examHall.*" %>
  <%@ page import="java.sql.Connection"%>
  <%@ page import="java.sql.PreparedStatement"%>
  <%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<link rel="stylesheet" href="../css/admin_css2.css"/>
</head>
<body class="body-img">	
<div class="navbar_css">
		<a href="admin-index.jsp">Home</a>
 			 <div class="dropdown_css">
   				<button class="dropbtn">Administration
      				<i class="fa fa-caret-down"></i>
   				 </button>
   				 <div class="dropdown-content">
   				 	 <a href="../admin_jsp/add-new-building.jsp">Add new building</a>
	     			 <a href="../admin_jsp/add-new-floor.jsp">Add new floor</a>
	      			<a href="../admin_jsp/add-new-room.jsp">Add new room</a>
	      			<a href="../admin_jsp/add-new-block.jsp">Add block</a>
	      			<a href="../admin_jsp/add-new-seat.jsp">Add seat</a>
	      			<a href="../admin_jsp/assign-seats.jsp">Assign seat</a>
    			</div>
    		 </div>
    		 
    		 <div class="dropdown_css_btn2">
    		<button class="dropbtn">Reports
      				<i class="fa fa-caret-down"></i>
   				 </button>
   				 <div class="dropdown-content">
   				 	 <a href="../admin_jsp/building-report.jsp">Building reports</a>
	     			 <a href="../admin_jsp/floor-report.jsp">Floor reports</a>
	      			<a href="../admin_jsp/room-report.jsp">Room reports</a>
	      			<a href="../admin_jsp/block-report.jsp">Block reports</a>
	      			<a href="../admin_jsp/assign-seat-report.jsp">Assign seat reports</a>
	      			<a href="../admin_jsp/clg-report.jsp">Collage Report</a>
	      			<a href="../admin_jsp/student-report.jsp">Student reports</a>
	      			<a href="../admin_jsp/contact-us-report.jsp">Contact us reports</a>
	    		</div>
	    	</div>
    		<!-- <a href="#home">Change password</a> -->
    		<a href="../adminLogin.html">Logout</a>
     </div>
     <%
     	Connection con1;
		PreparedStatement stmt;
		ResultSet rs;
		ResultSet rs2;
		DBCon db1=new DBCon();
		con1=db1.dbCon();
     	stmt=con1.prepareStatement("select count(*) from reg_db");
		rs=stmt.executeQuery();
		
		stmt=con1.prepareStatement("select count(*) from contact_us");
		rs2=stmt.executeQuery(); %>
   
    <div class="container">
	<div class="row" >
		<div class="col-md-1"></div>
		<div class="col-md-4" style="background-color: orange;margin-top:80px;padding:55px;color:white;font-size:30px;font-weight:bold;">
		Total Student<%if(rs.next())
		{
			int noOfReg=rs.getInt(1);
				out.print("<br>");%>
				<p style="margin-left:80px;margin-top:20px;font-size:40px;"><% out.print(noOfReg);%></p>
		<% } 
		else
		{
				out.print("<br>");%>
				<p style="margin-left:80px;margin-top:20px;font-size:40px;"><% out.print("0");%></p>
		<%} %>
			</div>
			
		
		<div class="col-md-2"></div>
		<div class="col-md-4" style="background-color: green;margin-top:80px;padding:55px;color:white;font-size:30px;font-weight:bold;">Total Contacts
		<%if(rs2.next())
		{
			int noOfCont=rs2.getInt(1);
				out.print("<br>");%>
				<p style="margin-left:80px;margin-top:20px;font-size:40px;"><% out.print(noOfCont);%></p>
		<% } 
		else
		{
				out.print("<br>");%>
				<p style="margin-left:80px;margin-top:20px;font-size:40px;"><% out.print("0");%></p>
		<%} %></div>
	</div>
	</div>
</body>
</html>