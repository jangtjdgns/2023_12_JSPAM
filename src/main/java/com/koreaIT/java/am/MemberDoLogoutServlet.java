package com.koreaIT.java.am;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/member/doLogout")
public class MemberDoLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8;");
	
		HttpSession session = request.getSession();
		// removeAttribute 메서드를 사용해서 키값을 넘겨주면 삭제 -> 세션이 비어있으므로 로그아웃 상태
		session.removeAttribute("loginedMemberId");
			
		response.getWriter().append("<script>alert('로그아웃 되었습니다.'); location.replace('../home/main');</script>");
	}
}
