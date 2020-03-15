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
		<a href="../admin_html/admin-index.jsp">Home</a>
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
	    		</div>
	    	</div>
    		<a href="../adminLogin.html">Logout</a>
     </div>
<%
		String db_reg=null,db_buld,db_floor,db_room,db_block,db_seat,db_clg;
		int i;
		Connection con1;
		PreparedStatement stmt;
		PreparedStatement stmt1;
		PreparedStatement stmt2;
		PreparedStatement stmt3;
		PreparedStatement stmt4;
		PreparedStatement stmt5;
		PreparedStatement stmt6;
		PreparedStatement stmt7;
		ResultSet rs;
		ResultSet rs1;
		ResultSet rs2;
		ResultSet rs3;
		ResultSet rs4;
		ResultSet rs5;
		ResultSet rs6;
		ResultSet rs7;
		DBCon db1=new DBCon();
		con1=db1.dbCon();
		
		stmt=con1.prepareStatement("select * from reg_db");
		rs=stmt.executeQuery();
		
		stmt1=con1.prepareStatement("select * from building_db");
		rs1=stmt1.executeQuery();
		
		stmt2=con1.prepareStatement("select * from floor_db");
		rs2=stmt2.executeQuery();
		
		stmt3=con1.prepareStatement("select * from room_db");
		rs3=stmt3.executeQuery();
		
		stmt4=con1.prepareStatement("select * from block_db");
		rs4=stmt4.executeQuery();
		
		stmt5=con1.prepareStatement("select * from seat_db");
		rs5=stmt5.executeQuery();
		
		stmt6=con1.prepareStatement("select * from clg_db");
		rs6=stmt6.executeQuery();
		
		
%>
		<div class="container">
		<div class="row" >
		<div class="col-md-3"></div>
		<div class="col-md-6" style="background-color: aliceblue;margin-top:40px;">
			<form action="assign-seats.jsp" method="post">
				<h2 style="color:orange;margin-left:20%;">Assign seats</h2><br/>
				<div class="textbox-search">
				<span class="span-ass-seat">Reg no:</span>
				<select name="reg_db" required="">
				<option value="">Select reg no </option>
					<% while(rs.next())
					{
						db_reg=rs.getString(2);
					%>
					<option value="<%= db_reg %>"> <%= db_reg %> </option>
					<%}
					%>
				</select>
				</div>
				
				<div class="textbox-search">
				<span class="span-ass-seat">Building:</span>
				<select name="building_db" required="">
				<option value="">Select Building </option>
					<% while(rs1.next())
					{
						db_buld=rs1.getString(2);
					%>
					<option value="<%= db_buld %>"> <%= db_buld %> </option>
					<%}
					%>
				</select>
				</div>
					
				<div class="textbox-search">
				<span class="span-ass-seat">Floor:</span>
				<select name="floor_db" required="">
				<option value="">Select floor </option>
					<% while(rs2.next())
					{
						db_floor=rs2.getString(2);
					%>
					<option value="<%= db_floor %>"> <%= db_floor %> </option>
					<%}
					%>
				</select>
				</div>
				
				<div class="textbox-search">
				<span class="span-ass-seat">Room:</span>
				<select name="room_db" required="">
				<option value="">Select room </option>
					<% while(rs3.next())
					{
						db_room=rs3.getString(2);
					%>
					<option value="<%= db_room %>"> <%= db_room %> </option>
					<%}
					%>
				</select>
				</div>
				
				<div class="textbox-search">
				<span class="span-ass-seat">Block:</span>
				<select name="block_db" required="">
				<option value="">Select block</option>
					<% while(rs4.next())
					{
						db_block=rs4.getString(2);
					%>
					<option value="<%= db_block %>"> <%= db_block %> </option>
					<%}
					%>
				</select>
				</div>
				
				<div class="textbox-search">
				<span class="span-ass-seat">Seat:</span>
				<select name="seat_db" required="">
				<option value="">Select seat </option>
					<% while(rs5.next())
					{
						db_seat=rs5.getString(2);
					%>
					<option value="<%= db_seat %>"> <%= db_seat %> </option>
					<%}
					%>
				</select>
				</div>
				
				<div class="textbox-search">
				<span class="span-ass-seat">Collage:</span>
				<select name="clg_db" required="">
				<option value="">Select collage </option>
					<% while(rs6.next())
					{
						db_clg=rs6.getString(2);
					%>
					<option value="<%= db_clg %>"> <%= db_clg %> </option>
					<%}
					%>
				</select>
				</div>
				<input type="submit" value="SUBMIT" class="search-btn">
		</form>
		<%
		String reg_no1,building,floor,room,block,seat,clg,db_reg1;
		int f=0;
		if(request.getParameter("reg_db")!=null)
		{
			f=0;
			reg_no1=request.getParameter("reg_db");
			building=request.getParameter("building_db");
			floor=request.getParameter("floor_db");
			room=request.getParameter("building_db");
			block=request.getParameter("block_db");
			seat=request.getParameter("seat_db");
			clg=request.getParameter("clg_db");
			

			stmt7=con1.prepareStatement("select * from assign_seat_db");
			rs7=stmt7.executeQuery();
			while(rs7.next())
			{
				db_reg1=rs7.getString(2);
				out.print(db_reg1+" "+reg_no1);
				if(reg_no1.equals(db_reg1))
				{
					f=1;
				}
			}
			if(f==0)
			{
				stmt=con1.prepareStatement("insert into assign_seat_db(reg_no,building,floor,room,block,seat,clg)values(?,?,?,?,?,?,?)");
				stmt.setString(1,reg_no1);
				stmt.setString(2,building);
				stmt.setString(3,floor);
				stmt.setString(4,room);
				stmt.setString(5,block);
				stmt.setString(6,seat);
				stmt.setString(7,clg);
				i=stmt.executeUpdate();
				if(i>0)
				{%>
					<script type='text/javascript'>
					alert('Seat is assigned to student');
					window.location.href='assign-seats.jsp';
					</script>
				<%}
				else
				{%>
				<script type='text/javascript'>
				alert('Seat is not to student');
				window.location.href='assign-seats.jsp';
				</script>
				<%}
			}
			else
			{%>
			<script type='text/javascript'>
			alert('Register number is already exist');
			window.location.href='assign-seats.jsp';
			</script>
			<%}
		
		}
		rs.close(); rs1.close(); rs2.close(); rs3.close(); rs4.close(); rs5.close(); rs6.close();
		stmt.close(); stmt1.close(); stmt2.close(); stmt3.close(); stmt4.close(); stmt5.close(); stmt6.close();
		con1.close();
	%>
		</div>
		</div>
	</div>
	
</body>
</html>