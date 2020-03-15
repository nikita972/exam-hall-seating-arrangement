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
</head>
<body>

<%!String rollno,session_emailid,session_pass,dbpro_id; %>
		<%
			rollno=request.getParameter("rollno");
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
			}
			 %>
			<table class="table-assign-seat" border="1">
			<tr>
			<th>Assign seat no</th>
			<th>Student reg no</th>
			<th>Building</th>
			<th>Floor</th>
			<th>Room</th>
			<th>Block</th>
			<th>Seat</th>
			<th>Collage</th>
			</tr>
			<%
				stmt=con1.prepareStatement("select * from assign_seat_db");
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
</body>
</html>