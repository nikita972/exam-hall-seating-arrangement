package com.examHall;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLogin1 extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_name=request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
		PrintWriter pw=response.getWriter();
		pw.print("<script type='text/javascript'>");
		String uname="admin";
		String pass="admin";
		if(uname.equals(user_name) && pass.equals(password))
		 {
		       session.setAttribute("username",user_name);
		       session.setAttribute("password",user_name);
		       pw.print("alert('Login sucessful');");
		        pw.print("window.location.href='admin_jsp/admin-index.jsp'");
		    }
		    else
		    {
		       pw.print("alert('Please Enter Correct Username or Password');");
		       pw.print("window.location.href='adminLogin.html'");
		    }
	
		pw.print("</script>");
		pw.close();
	}

}
