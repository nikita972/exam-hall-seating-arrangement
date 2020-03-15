package com.examHall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Registration extends HttpServlet {
	Connection con1;
	PreparedStatement stmt;
	ResultSet rs;
	String emailid;
	int num,i;
	DBCon db1=new DBCon();
	RandomNoGenerate rn=new RandomNoGenerate();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		con1=db1.dbCon();
		HttpSession session=request.getSession();
		emailid=(String)session.getAttribute("emailid");
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		long mob_no2,aadhaar_no1;
		int cnt=0,randumNum;
		String pro_id,reg_no,name,dob,aadhaar_no, mobnum,email_id,password,db_reg_no;
		
		randumNum=rn.rNum();
		pro_id=String.valueOf(randumNum);
		reg_no=request.getParameter("reg_no");
		name=request.getParameter("name");
		dob=request.getParameter("dob");
		mobnum=request.getParameter("mob_num");
		aadhaar_no=request.getParameter("aadhaar_no");
		email_id=request.getParameter("email_id");
		password=request.getParameter("password");
		mob_no2=Long.parseLong(mobnum);
		aadhaar_no1=Long.parseLong(aadhaar_no);
		pw.print("<script type='text/javascript'>");
		try {
				stmt=con1.prepareStatement("select * from reg_db");
				rs=stmt.executeQuery();
				cnt=0;
				while(rs.next())
				{
					db_reg_no=rs.getString(2);
					if(db_reg_no.equals(reg_no))
					{
						cnt=1;
					}
				}
				if(cnt==1)
				{	
					pw.print("alert('Registration number is already exits');");
					pw.print("window.location.href='index.html'");
					//pw.print("</script>");
				}
				else
				{
					try {
						stmt=con1.prepareStatement("insert into reg_db(	profile_id,reg_no,name,dob,mob_num,aadhaar_no,email_id,password)values(?,?,?,?,?,?,?,?)");
						stmt.setString(1,pro_id);
						stmt.setString(2,reg_no);
						stmt.setString(3,name);
						stmt.setString(4,dob);
						stmt.setLong(5,mob_no2);
						stmt.setLong(6,aadhaar_no1);
						stmt.setString(7,email_id);
						stmt.setString(8,password);
						num=stmt.executeUpdate();
						
						stmt=con1.prepareStatement("insert into update_pro(profile_id,address,branch,sem)values(?,?,?,?)");
						stmt.setString(1,pro_id);
						stmt.setString(2,"");
						stmt.setString(3,"");
						stmt.setString(4,"");
						i=stmt.executeUpdate();
						
						if(num>0 && i>0)
						{
							pw.print("alert('Registration is sucessfull');");
							pw.print("window.location.href='login.html'");
						}
						else
						{
							pw.print("alert('Registration is unsucessfull');");
							pw.print("window.location.href='index.html'");
						}
					}
					catch (SQLException e) {
						
						e.printStackTrace();
					}
				}
			} 
		catch (SQLException e1) 
		{
			e1.printStackTrace();
		}
		pw.print("</script>");
		pw.close();
		try {
				con1.close();
				stmt.close();
				rs.close();
			}
			 catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}
