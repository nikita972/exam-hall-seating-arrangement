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
<link rel="stylesheet" href="../css/admin_css2.css" />
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="../js/bootstrap.js"></script>
</head>
<body>
<div class="navbar_css">
		<a href="../admin_html/admin_index.html">Home</a>
 			 <div class="dropdown_css">
   				<button class="dropbtn">Administration
      				<i class="fa fa-caret-down"></i>
   				 </button>
   				 <div class="dropdown-content">
   				 	 <a href="add-new-building.jsp">Add new building</a>
	     			 <a href="add-new-floor.jsp">Add new floor</a>
	      			<a href="add-new-room.jsp">Add new room</a>
	      			<a href="add-new-block.jsp">Add block</a>
	      			<a href="add-new-seat.jsp">Add seat</a>
	      			<a href="assign-seats.jsp">Assign seat</a>
    			</div>
    		 </div>
    		 
    		 <div class="dropdown_css_btn2">
    		<button class="dropbtn">Reports
      				<i class="fa fa-caret-down"></i>
   				 </button>
   				 <div class="dropdown-content">
   				 	 <a href="building-report.jsp">Building reports</a>
	     			 <a href="floor-report.jsp">Floor reports</a>
	      			<a href="room-report.jsp">Room reports</a>
	      			<a href="block-report.jsp">Block reports</a>
	      			<a href="assign-seat-report.jsp">Assign seat reports</a>
	      			<a href="clg-report.jsp">Collage Report</a>
	      			<a href="student-report.jsp">Student reports</a>
	      			<a href="../admin_jsp/contact-us-report.jsp">Contact us reports</a>
	    		</div>
	    	</div>
    		<a href="../adminLogin.html">Logout</a>
     </div>
<div class="container">
	<div class="row" >
		<div class="col-md-1"></div>
		<div class="col-md-10" style="background-color: aliceblue;margin-top:40px;">
			<form action="delete-row.jsp" method="post">
				<h2 style="color:orange;margin-left:15%;">Student reports</h2><br/>
				<table class="table-assign-seat" border="1">
					<tr>
					<th>Profile id</th>
					<th>Student reg no</th>
					<th>Name</th>
					<th>DOB</th>
					<th>Mobile no.</th>
					<th>Aadhaar no.</th>
					<th>Email id</th>
					<th>Password</th>
					</tr>
					<%
						Connection con1;
						PreparedStatement stmt;
						ResultSet rs;
						DBCon db1=new DBCon();
						con1=db1.dbCon();
						stmt=con1.prepareStatement("select * from reg_db");
						rs=stmt.executeQuery(); 
						while(rs.next())
						{%>
							
							<tr>
								<td><%= rs.getString(1)%></td>
								<td> <%= rs.getString(2)%></td>
								<td> <%= rs.getString(3)%></td>
								<td> <%= rs.getString(4)%></td>
								<td> <%= rs.getString(5)%></td>
								<td> <%= rs.getString(6)%></td>
								<td> <%= rs.getString(7)%></td>
								<td> <%= rs.getString(8)%></td>
							</tr>
						
						<%
						}
						%>
						
				</table>
		</form>
		</div>
		</div>
		</div>

</body>
</html>