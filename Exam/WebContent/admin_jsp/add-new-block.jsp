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
		<a href="../admin_jsp/admin-index.jsp">Home</a>
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
	<div class="container">
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-7" style="background-color: aliceblue;margin-top:40px;">
			<form action="add-new-block.jsp" method="post">
				<h2 style="color:orange;margin-left:20%;">Add new block</h2><br/>
				<div class="textbox-search">
				<span class="span-search">Block title:</span>
				<input type="text" name="block" placeholder="block1"><br/><br/>
				</div>
				<input type="submit" value="SUBMIT" class="search-btn">
		</form>
		</div>
		</div>
		</div>
		<%! String block,db_block; 
		int f=0;
		%>
			<%Connection con1;
			PreparedStatement stmt;
			ResultSet rs;
			DBCon db1=new DBCon();
			con1=db1.dbCon();
			if(request.getParameter("block")!=null)
			{
				f=0;
				block=request.getParameter("block");
				stmt=con1.prepareStatement("select * from block_db");
				rs=stmt.executeQuery();
				while(rs.next())
				{
					db_block=rs.getString(2);
					if(block.equals(db_block))
					{
						f=1;
					}
				}
				if(f==1)
				{%>
					<script type='text/javascript'>
					alert('Block is already added.please add new block');
					window.location.href='add-new-block.jsp';
					</script>
				<%}
				else
				{
				stmt=con1.prepareStatement("insert into block_db(block)values(?)");
				stmt.setString(1,block);
				int i=stmt.executeUpdate();
				if(i>0)
				{%>
					<script type='text/javascript'>
					alert('Block added sucessfully');
					window.location.href='add-new-block.jsp';
					</script>
				<%}
				else
				{%>
					<script type='text/javascript'>
					alert('Block not added sucessfully');
					window.location.href='add-new-block.jsp';
					</script>
				<%}
				}
				}%>
</body>
</html>