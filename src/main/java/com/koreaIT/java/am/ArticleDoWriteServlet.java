package com.koreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/doWrite")
public class ArticleDoWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// get과 post를 같이 사용할때 override 어노테이션 추가하면 좋음
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8;");
		
		Connection conn = null;
		
		try {
			Class.forName(Config.getDBDriverName());
			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassword());

			// 제목, 내용 파라미터 받음
			String title = request.getParameter("title");
			String body = request.getParameter("body");			
			
			// 제목이나 내용이 빈칸일때 뒤로가기
			if(title.trim().length() == 0 || body.trim().length() == 0) {
				response.getWriter().append("<script>alert('빈칸을 채워주세요.'); history.back();</script>");
			} else {
				SecSql sql = SecSql.from("INSERT INTO article");
				sql.append("SET regDate = NOW()");
				sql.append(", updateDate = NOW()");
				sql.append(", title = ?", title);
				sql.append(", `body` = ?", body);
				
				int id = DBUtil.insert(conn, sql);
				System.out.println(id);
				
				response.getWriter().append(String.format("<script>alert('%d번 글을 작성했습니다.'); location.replace('list');</script>", id));
			}
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
	
	// get 방식을 사용하면 submit 시 주소에 값이 직접적으로 드러남 
	// post 방식을 사용하면 submit 시 주소에 값이 직접적으로 드러나지않음
	// 		-> 값을 못보는것이 아님	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
