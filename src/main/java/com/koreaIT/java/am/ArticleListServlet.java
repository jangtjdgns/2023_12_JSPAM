package com.koreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/list")
public class ArticleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = null;
		
		try {
			Class.forName(Config.getDBDriverName());
			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassword());
			
			// 현재 페이지, 기준 값 지정
			int page = 1;
			
			// 조건확인
			if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			// 한 페이지의 게시물 개수
			int itemsInAPage = 10; 
			int limitFrom = (page - 1) * itemsInAPage;
						
			// %연산자를 사용해서 조건문을 추가하는 것보다
			// double과 Math를 사용하는 것이 더 간단함
			
			SecSql sql = SecSql.from("SELECT COUNT(*) FROM article");
			
			int totalCount = DBUtil.selectRowIntValue(conn, sql);
			
			int totalPageCnt = (int) Math.ceil((double) totalCount / itemsInAPage);
			
			sql = SecSql.from("SELECT * FROM article");
			sql.append("ORDER BY id DESC");
			sql.append("LIMIT ?, ?", limitFrom, itemsInAPage);
			
			List<Map<String, Object>> articleListMap = DBUtil.selectRows(conn, sql);
			
			request.setAttribute("articleListMap", articleListMap);
			request.setAttribute("page", page);
			request.setAttribute("totalPageCnt", totalPageCnt);
			request.setAttribute("itemsInAPage", itemsInAPage);
			
			request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러: " + e);
		} finally {
			try {
	            if (conn != null && !conn.isClosed()) {
	                conn.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
	}
}
