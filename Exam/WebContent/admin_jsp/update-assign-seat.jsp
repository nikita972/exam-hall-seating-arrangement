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
<%! String seat,db_seat;
			int f=0;%>
		
	<%Connection con1;
	PreparedStatement stmt;
	ResultSet rs;
	DBCon db1=new DBCon();
	con1=db1.dbCon();
	//String str=(String)session.getAttribute("roll");
	String str=request.getParameter("reg_no");
	out.print("roll="+str);
	/*if(request.getParameter("seat")!=null)
	{
		f=0;
		seat=request.getParameter("seat");
		stmt=con1.prepareStatement("select * from seat_db");
		rs=stmt.executeQuery();
	}*/
		%>
</body>
</html>