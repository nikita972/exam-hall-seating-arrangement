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
<link rel="stylesheet" href="css/style1.css" />
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/style2.css"/>
<script>
     //intput text
        function onlyAlphabets(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode > 31 && charCode < 33) )
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
        }
// contCT NO
    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
        }
</script>
</head>
<body>
	<div id="nav" style="background-color:yellow">
<div class="container">
<div class="row" >
 <div class="pull-right">
	<ul class="nav navbar-nav" >
	
		<li><a href="Display_pro.jsp">Home</a></li>
		<li><a href="contact-us.jsp">Contact Us</a><li>
		<li><a href="search.jsp">Search</a><li>
		<li><a href="Logout">Logout</a><li>
	</ul>
	</div>
	</div>
</div>
</div>


	<div class="container">
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-7" style="background-color: aliceblue;margin-top:40px;">
			<form action="">
				<h2 style="color:orange;margin-left:20%;">Contact Us</h2><br/>
				
			<div class="text-box1">
			<span>Name:</span>
				<input type="text" name="name" placeholder="Enter full name" pattern="[a-zA-Z ]{6,25}" 
				title="Please Enter Full Name" required onkeypress="return onlyAlphabets(event,this);"><br/><br/>
			</div>
			<div class="text-box1">
			<span>Email id:</span>
				<input type="text" name="email_id" placeholder="example@gmail.com " required="" title="Please Enter valid email id"
				pattern="[a-z0-9._%+-]+@[a-z9-9.-]+\.[a-z]{2,4}$"><br/><br/>
			</div>
			<div class="text-box1">
			<span>Mobile Number:</span>
				<input type="text" name="mob_no" title="10 numeric characters only" required="" onkeypress="return isNumber(event)" 
				maxlength="10" minlength="0"  placeholder="(10 chars) 9845710286" pattern="[0-9]{10,}"><br/><br/>
			</div>
			
				<span>Message:</span>
				<textarea name="msg" required  minlength="10" maxlength="10000"></textarea>
		
				<input type="submit" value="CONTACT US" class="search-btn">
			
		</form>
		</div>
		</div>
		</div>
		<%!String name,email_id,msg,mob_no;
		long mob_no2;
		int i;%>
		<%
			name=request.getParameter("name");
			email_id=request.getParameter("email_id");
			mob_no=request.getParameter("mob_no");
			msg=request.getParameter("msg");
			if(name!=null && email_id!=null && mob_no!=null && msg!=null)
			{
		
				Connection con1;
				PreparedStatement stmt;
				ResultSet rs;
				DBCon db1=new DBCon();
				con1=db1.dbCon();
				mob_no2=Long.parseLong(mob_no);
				stmt=con1.prepareStatement("insert into contact_us(name,email_id,mob_num,msg)values(?,?,?,?)");
				stmt.setString(1,name);
				stmt.setString(2,email_id);
				stmt.setLong(3,mob_no2);
				stmt.setString(4,msg);
				i=stmt.executeUpdate();
				if(i>0)
				{%>
				<script type='text/javascript'>
				alert('Your contact details is added');
				window.location.href='Display_pro.jsp';
				</script>
				<%}
				else
				{%>
				
					<script type='text/javascript'>
					alert('Your contact details is not added');
					window.location.href='contact-us.jsp';
					</script>
				<%}
				
			}
			
		%>
</body>
</html>