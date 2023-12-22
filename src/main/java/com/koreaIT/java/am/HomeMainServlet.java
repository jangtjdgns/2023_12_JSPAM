package com.koreaIT.java.am;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home/printDan")
public class HomeMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8;");
		
		int inputDan = Integer.parseInt(request.getParameter("dan"));
		String inputColor = request.getParameter("color");
		int inputLimit = Integer.parseInt(request.getParameter("limit"));
		
		response.getWriter().append(String.format("<div style=\"color: %s;\">== %d단 ==</div>", inputColor, inputDan));
		
		for(int i=1; i<=inputLimit; i++) {
			response.getWriter().append(String.format("<div style=\"color: %s;\">%d * %d = %d</div>", inputColor, inputDan, i, inputDan * i));
		}
	}
}
