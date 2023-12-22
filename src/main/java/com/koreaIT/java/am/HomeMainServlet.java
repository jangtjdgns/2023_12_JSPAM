package com.koreaIT.java.am;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home/main")
public class HomeMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8;");
		
		int inputDan = Integer.parseInt(request.getParameter("dan"));
		String color = request.getParameter("color");
		int limit = Integer.parseInt(request.getParameter("limit"));
		
		response.getWriter().append(String.format("<div style='color: %s;'>== %d단 ==</div>", color, inputDan));
		
		for(int i=1; i<=limit; i++) {
			response.getWriter().append(String.format("<div style='color: %s;'>%d * %d = %d</div>", color, inputDan, i, inputDan * i));
		}
	}
}
