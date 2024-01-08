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
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/list")
public class ArticleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = null;
		
		try {
			Class.forName(Config.getDBDriverName());
			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassword());
			
			int page = 1;
			
			if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			// 검색어 추가
			String searchKeyword = "";
			
			// 검색어 null, 공백 검사
			if(request.getParameter("searchKeyword") != null && request.getParameter("searchKeyword").length() != 0) {
				searchKeyword = request.getParameter("searchKeyword");
			}
			
			int itemsInAPage = 10; 
			int limitFrom = (page - 1) * itemsInAPage;
			
			// 검색어가 포함된 게시물의 수를 가져오도록 변경
			SecSql sql = SecSql.from("SELECT COUNT(*) FROM article");
			sql.append("WHERE title LIKE CONCAT('%', ? ,'%')", searchKeyword);
			
			int totalCount = DBUtil.selectRowIntValue(conn, sql);
			
			int totalPageCnt = (int) Math.ceil((double) totalCount / itemsInAPage);
			
			sql = SecSql.from("SELECT A.*, M.name AS writerName");
			sql.append("FROM article A");
			sql.append("INNER JOIN `member` M");
			sql.append("ON A.memberId = M.id");
			sql.append("WHERE A.title LIKE CONCAT('%', ?, '%')", searchKeyword);	// SQL 쿼리에 검색어 조건 추가
			sql.append("ORDER BY A.id DESC");
			sql.append("LIMIT ?, ?", limitFrom, itemsInAPage);
			
			List<Map<String, Object>> articleListMap = DBUtil.selectRows(conn, sql);
			
			HttpSession session = request.getSession();
			
			int loginedMemberId = -1;
			
			if(session.getAttribute("loginedMemberId") != null) {
				loginedMemberId = (int) session.getAttribute("loginedMemberId");
			}
			
			request.setAttribute("loginedMemberId", loginedMemberId);
			request.setAttribute("articleListMap", articleListMap);
			request.setAttribute("page", page);
			request.setAttribute("totalPageCnt", totalPageCnt);
			request.setAttribute("itemsInAPage", itemsInAPage);
			request.setAttribute("searchKeyword", searchKeyword);	// jsp로 넘김
			
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
