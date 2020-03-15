package com.examHall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	Connection con1;
	PreparedStatement stmt;
	ResultSet rs;
	DBCon db1=new DBCon();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		con1=db1.dbCon();
		PrintWriter pw=response.getWriter();
		HttpSession session=request.getSession();
		pw.print("<script type='text/javascript'>");
		int f=0;
		String emailid,	password,db_email,db_pass;
		emailid=request.getParameter("emailid");
		password=request.getParameter("password");
		try {
				stmt=con1.prepareStatement("select * from reg_db");
				rs=stmt.executeQuery();
				while(rs.next())
				{
					db_email=rs.getString(7);
					db_pass=rs.getString(8);
					if(emailid.equals(db_email) && password.equals(db_pass))
					{
						f=1;
					}
				}
				if(f==1)
				{
					session.setAttribute("emailid", emailid);
					session.setAttribute("password", password);
					//response.sendRedirect("http://localhost:9090/Exam/login-jsp.jsp");
					pw.print("alert('login sucessful');");
					pw.print("window.location.href='update-pro.jsp';");
				}
				else
				{
					pw.print("alert('Login unsucessful');");
					pw.print("window.location.href='login.html'");
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		pw.print("</script>");
			pw.close();
			
		try{
				con1.close();
				stmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		
	

}
