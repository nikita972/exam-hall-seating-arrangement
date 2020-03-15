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
	
%>	

<div id="nav" style="background-color:yellow">
<div class="container">
<div class="row" >
 <div class="pull-right">
	<ul class="nav navbar-nav" >
	
		<li><a href="">Home</a></li>
		<li><a href="">About Us</a></li>
		<li><a href="">Contact Us</a><li>
		<li><a href="">Logout</a><li>
	</ul>
	</div>
	</div>
</div>
</div>

<div class="container">
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-7">
			<form action="update-pro.jsp" method="post">
			<center><h2 style="color:darkmagenta;">Update Profile</center><br/>
			<table border="1" class="table" width="120%">
			<tr>
				<th width="40%"  style="padding:10px;">
				<span>Registration No:</span></th>
				<td width="60%" style="padding:10px;">
					<div class="update-box1"><input type="text" name="reg_no" value="<%=reg_no%>" >
					</div>
				</td>
				
			</tr>
			<tr>
				<th style="padding:10px;"><span>Name:</span></th>
				<td style="padding:10px;">
					<div class="update-box1"><input type="text" name="name" value="<%=name%>" class="heighttext">
					</div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;"><span>Date Of Birth:</span></th>
				<td style="padding:10px;">
					<div class="update-box1"><input type="text" name="dob" value="<%=dob%>">
					</div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;"><span>Mobile Number:</span></th>
				<td style="padding:10px;">
					<div class="update-box1"><input type="text" name="mob_num" value="<%=mob_no%>">
					</div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;"><span>AAdhaar Number:</span></th>
				<td style="padding:10px;">
					<div class="update-box1"><input type="text" name="aadhaar_no" value="<%=aadhaar_no%>">
					</div>
				</td>
			</tr>
			<tr>
				<th style="padding:10px;">Address:</th>
				<td style="padding:10px;"><textarea name="address" class="update-textarea"></textarea></td>
			</tr>
			<tr>
				<th style="padding:10px;">Branch:</th>
				<td style="padding:10px;">
					<select name="branch" class="update-select">
					<option value="bca">BCA</option>
					<option value="bba">BBA</option>
					<option value="bcom">BCom</option>
					<option value="mca">MCA</option>
					<option value="mba">MBA</option>
					<option value="mcom">MCom</option>
				</select></td>
			</tr>
			<tr>
				<th style="padding:10px;">Semister:</th>
				<td style="padding:10px;">
					<select name="sem" class="update-select">
					<option value="i">I</option>
					<option value="ii">II</option>
					<option value="iii">III</option>
					<option value="iv">IV</option>
					<option value="v">V</option>
					<option value="vi">VI</option>
				</select></td>
			</tr>
			</table>
			<center><input type="submit" value="Update" class="update-btn"></center>
			</form>
		</div>
		<div class="col-md-3"></div>
		</div>
	</div>
	<%
		if(request.getParameter("address")!=null)
		{
			address=request.getParameter("address");
			branch=request.getParameter("branch");
			semister=request.getParameter("sem");
		  	stmt=con1.prepareStatement("update  update_pro set address=?,branch=?,sem=? where profile_id=?");
		  	stmt.setString(1,address);
			stmt.setString(2,branch);
			stmt.setString(3,semister);
			stmt.setString(4,dbpro_id);
			i=stmt.executeUpdate();
			if(i>0)
			{%>
				<script type='text/javascript'>
				alert('Profile is updated');
				window.location.href='Display_pro.jsp';
				</script>
			<%}
			else
			{%>
			<script type='text/javascript'>
			alert('Profile is not updated');
			window.location.href='update-pro.jsp';
			</script>
			<%}
		}
	%>
</body>
</html>