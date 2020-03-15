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
		<div class="col-md-7" style="background-color: aliceblue;margin-top:40px;">
			<form action="">
			<h2 style="color:orange;margin-left:20%;">Delete Collage</h2><br/>
				<div class="textbox-search">
				<span class="span-search">Enter collage:</span>
				<input type="text" name="building"><br/><br/>
				</div>
				<input type="submit" value="DELETE" class="search-btn">
		<a href="clg-report.jsp"><input type="button" value="BACK" class="back-btn"></a>
				
		</form>
		</div>
		</div>
		</div>
		<%! String building1,db_build,bid,db_id; 
			int i;
			%>
		<%
			Connection con1;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		DBCon db1=new DBCon();
		con1=db1.dbCon();
		stmt=con1.prepareStatement("select * from clg_db");
		rs=stmt.executeQuery();
		if(request.getParameter("building")!=null)
			{
				building1=request.getParameter("building");
				while(rs.next())
				{
					bid=rs.getString(1);
					db_build=rs.getString(2);
					if(building1.equals(db_build))
					{
						db_id=rs.getString(1);
					}
				}
				stmt=con1.prepareStatement("delete from clg_db where clgno=?");
				stmt.setString(1,db_id);
				i=stmt.executeUpdate();
				if(i>0)
				{%>
					<script type='text/javascript'>
					alert('Collage name is deleted');
					window.location.href='clg-report.jsp';
					session.invalidate();
					</script>
				<%}
				else
				{%>
				<script type='text/javascript'>
				alert('Collage name is not deleted enter valid collage name');
				window.location.href='clg-report.jsp';
				session.invalidate();
				</script>
					<%}
					}
				
			stmt.close();
			rs.close();
			con1.close();
				%>
			
		
</body>
</html>				
</body>
</html>