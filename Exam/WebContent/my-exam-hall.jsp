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
	<%!String rollno,session_emailid,session_pass,dbpro_id;
		int f=0;
		%>
		<%
			rollno=request.getParameter("rollno");
			if(rollno !=null)
			{
				session_emailid=(String)session.getAttribute("emailid");
				session_pass=(String)session.getAttribute("password");
				Connection con1;
				PreparedStatement stmt;
				PreparedStatement stmt1;
				ResultSet rs;
				ResultSet rs1;
				DBCon db1=new DBCon();
				con1=db1.dbCon();
				stmt=con1.prepareStatement("select * from reg_db where email_id=? AND password=?");
				stmt.setString(1,session_emailid);
				stmt.setString(2,session_pass);
				rs=stmt.executeQuery();
				while(rs.next())
				{
					dbpro_id=rs.getString(2);
				}
				if(rollno.equals(dbpro_id))
				{
					 %>
				<div class="container">
				<div class="row" >
					 <div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:deepskyblue;margin-top:20px;padding:25px;
								font-size:20px;"> My Exam Hall</div>
						</div>
					
					
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-8" style="background-color: aliceblue;margin-top:0px;">
						<table class="table-assignseat" style="margin-top:15px;" >
						<%
							stmt=con1.prepareStatement("select * from assign_seat_db where reg_no=?");
							stmt.setString(1,dbpro_id);
							rs=stmt.executeQuery(); 
							while(rs.next())
							{%>
								
								<tr>
									<th>Registration no:<br/><br/></th>
									<td> <%= rs.getString(2)%><br/><br/></td>
								</tr>
								<tr>
									<th>Building:<br/><br/></th>
									<td> <%= rs.getString(3)%><br/><br/></td>
								</tr>
								<tr>
									<th>Floor:<br/><br/></th>
									<td> <%= rs.getString(4)%><br/><br/></td>
								</tr>
								<tr>
									<th>Room:<br/><br/></th>
									<td> <%= rs.getString(5)%><br/><br/></td>
								</tr>
								<tr>
									<th>Block<br/><br/></th>
									<td> <%= rs.getString(6)%><br/><br/></td>
								</tr>
								<tr>
									<th>Seat:<br/><br/></th>
									<td> <%= rs.getString(7)%><br/><br/></td>
								<tr>
									<th>College:<br/><br/></th>
									<td> <%= rs.getString(8)%><br/><br/></td>
								</tr>
							<%
							}
							%>
							
						</table>
					<% }
				else
				{%>
				<script type='text/javascript'>
				alert('Enter valid registration number');
				window.location.href='search.jsp';
				</script>
				<%}
				}
				%>
								<center><a href="search.jsp"><input type="button" value="BACK" class="back-btn"></a></center>
				
					</div>
				</div>
			</div>	
</body>
</html>