package com.examHall;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Aa
 */
public class Aa extends HttpServlet {
		RandomNoGenerate rr=new RandomNoGenerate();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int num=rr.rNum();
	PrintWriter pw=response.getWriter();
	pw.print(num);
		
	}

}
