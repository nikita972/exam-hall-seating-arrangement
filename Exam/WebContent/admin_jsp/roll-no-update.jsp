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
<div class="container">
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-8" style="background-color: aliceblue;margin-top:40px;">
			<form action="" method="get">
				<h2 style="color:orange;margin-left:20%;">Update</h2><br/>
				<div class="textbox-update">
				<span class="span-upadte">Enter reg number of student for update information:</span><br><br/>
				<input type="text" name="reg_no" id="reg_no"><br/><br/>
				</div>
				<input type="submit" value="SUBMIT" class="search-btn">
		</form>
	<%! String str,db_reg_no; 
		int cnt;%>
	<%
		Connection con1;
		PreparedStatement stmt;
		ResultSet rs;
		DBCon db1=new DBCon();
		con1=db1.dbCon();
		if(request.getParameter("reg_no")!=null) 
		{
			str=request.getParameter("reg_no");
			session.setAttribute("roll",str);
			stmt=con1.prepareStatement("select * from assign_seat_db");
			rs=stmt.executeQuery();
			cnt=0;
			while(rs.next())
			{
				db_reg_no=rs.getString(2);
				if(db_reg_no.equals(str))
				{
					
					cnt=1;
				}
			}
			if(cnt==1)
			{%>
			<script type='text/javascript'>
			var str=document.getElementById("reg_no");
			document.write(str.value)
			window.location.href='update-assign-seat.jsp?reg_no='+str.value;
			</script>
			<%}
			else
			{%>
			<script type='text/javascript'>
			alert('Enter valid roll number of student');
			window.location.href='roll-no-update.jsp';
			</script>
			<%}
			
		}
		%>
		
		</div>
		</div>
		</div>
</body>
</html>