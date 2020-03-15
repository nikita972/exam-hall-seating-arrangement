package com.examHall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginExeUser extends HttpServlet {
	Connection con1;
	PreparedStatement stmt;
	ResultSet rs;
	String db_emailid,db_pass,emailid,password;
	int cnt;
	DBCon db1=new DBCon();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		con1=db1.dbCon();
		PrintWriter pw=response.getWriter();
		HttpSession session=request.getSession();
		pw.print("<script type='text/javascript'>");
		emailid=request.getParameter("emailid");
		password=request.getParameter("password");
		try {
			stmt=con1.prepareStatement("select * from reg_db");
			rs=stmt.executeQuery();
			while(rs.next())
			{
				db_emailid=rs.getString(7);
				db_pass=rs.getString(8);
				
				if(db_emailid.equals(emailid) && db_pass.equals(password))
				{
					cnt=1;
				}
			}
			if(cnt==1)
			{	
				session.setAttribute("emailid", emailid);
				session.setAttribute("password", password);
				pw.print("alert('Login sucessfully');");
				pw.print("window.location.href='Display_pro.jsp'");
			}
			else
			{
				pw.print("alert('Login unsucessfully');");
				pw.print("window.location.href='loginExeUser.html'");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		pw.print("</script>");
	}
}
