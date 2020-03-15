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
<link rel="stylesheet" href="../css/bootstrap.css"/>
<link rel="stylesheet" href="../css/admin_css2.css"/>
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
	      			<a href="../admin_jsp/contact-us-report.jsp">Contact us reports</a>
	    		</div>
	    	</div>
    		<a href="../adminLogin.html">Logout</a>
     </div>
	<div class="container">
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-7" style="background-color: aliceblue;margin-top:40px;">
			<form action="">
				<h2 style="color:orange;margin-left:20%;">Add new room</h2><br/>
				<div class="textbox-search">
				<span class="span-search">Room title:</span>
				<input type="text" name="room" placeholder="room1"><br/><br/>
				</div>
				<input type="submit" value="SUBMIT" class="search-btn">
		</form>
		</div>
		</div>
		</div>
		<%! String room,db_room;
			int f=0;%>
		
			<%Connection con1;
			PreparedStatement stmt;
			ResultSet rs;
			DBCon db1=new DBCon();
			con1=db1.dbCon();
			if(request.getParameter("room")!=null)
			{
				f=0;
				room=request.getParameter("room");
				stmt=con1.prepareStatement("select * from room_db");
				rs=stmt.executeQuery();
				while(rs.next())
				{
					db_room=rs.getString(2);
					if(room.equals(db_room))
					{
						f=1;
					}
				}
				if(f==1)
				{%>
					<script type='text/javascript'>
					alert('Room is already added.please add new floor');
					window.location.href='add-new-room.jsp';
					</script>
				<%}
				else
				{
				stmt=con1.prepareStatement("insert into room_db(room)values(?)");
				stmt.setString(1,room);
				int i=stmt.executeUpdate();
				if(i>0)
				{%>
					<script type='text/javascript'>
					alert('Room added sucessfully');
					window.location.href='add-new-room.jsp';
					</script>
				<%}
				else
				{%>
					<script type='text/javascript'>
					alert('Room not added sucessfully');
					window.location.href='add-new-room.jsp';
					</script>
				<%}
				}
				}%>
</body>
</html>