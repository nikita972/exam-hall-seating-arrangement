<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="Registration" method="post">
			<center><h2 style="background-color:lightseagreen;color:white;">Update Profile</center><br/>
			
			<div class="text-box1">
			<span>Registration No:</span>
			
				<input type="text" name="reg_no" ><br/><br/>
			</div>
			
			<div class="text-box1">
			<span>Name:</span>
				<input type="text" name="name"><br/><br/>
			</div>
			
			<div class="text-box1">
			<span>Date Of Birth:</span>
				<input type="text" name="dob"><br/><br/>
			</div>
			
			<div class="text-box1">
			<span>Mobile Number:</span>
				<input type="text" name="mob_num"><br/><br/>
			</div>
			
			<div class="text-box1">
			<span>AAdhaar Number:</span>
				<input type="text" name="aadhaar_no"><br/><br/>
			</div>
			</form>
	<%
		out.print("lee");
	%>	
</body>
</html>