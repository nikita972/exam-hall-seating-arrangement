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
	
		<li><a href="">Home</a></li>
		<li><a href="">Contact Us</a><li>
		<li><a href="">Search</a><li>
		<li><a href="">Logout</a><li>
	</ul>
	</div>
	</div>
</div>
</div>


	<div class="container">
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-7" style="background-color: aliceblue;margin-top:40px;">
			<form action="delete-pro.jsp" method="post">
				<h2 style="color:orange;margin-left:20%;">Delete profile</h2><br/>
				<div class="textbox-search">
				<span class="span-search">Enter Reg number:</span>
				<input type="text" name="rollno"><br/><br/>
				</div>
				<input type="submit" value="DELETE" class="search-btn">
		</form>
		</div>
		</div>
		</div>	
		<%!String rollno,session_emailid,session_pass,dbpro_id,db_reg;
		int f=0,i,j;
		%>
		<%
			rollno=request.getParameter("rollno");
			if(rollno !=null)
			{
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
					db_reg=rs.getString(2);
				}
				if(rollno.equals(db_reg))
				{
					
							stmt=con1.prepareStatement("delete from reg_db where profile_id=?");
							stmt.setString(1,dbpro_id);
							i=stmt.executeUpdate(); 
							stmt=con1.prepareStatement("delete from update_pro where profile_id=?");
							stmt.setString(1,dbpro_id);
							j=stmt.executeUpdate(); 
							if(i>0 && j>0)
							{%>
							<script type='text/javascript'>
							alert('Profile is deleted');
							window.location.href='Logout';
							</script>
							<%}
							else
							{%>
							
								<script type='text/javascript'>
								alert('Enter valid registration number');
								window.location.href='delete-pro.jsp';
								</script>
							<%}
						}
					}
				%>
	</body>
</html>