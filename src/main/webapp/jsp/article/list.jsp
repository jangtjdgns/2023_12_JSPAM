<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 형변환 
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	int curPage = (int) request.getAttribute("page");
	int totalPageCnt = (int) request.getAttribute("totalPageCnt");
%>
    
<!DOCTYPE html>
<head>
<html>
<meta charset="UTF-8">
<title>게시물목록</title>
</head>

<body>
	<h1>게시물 목록</h1>
	<table border="1">
		<!-- column의 길이를 지정 -->
		<colgroup>
			<col />
			<col width="200"/>
			<col width="500"/>
		</colgroup>
		
		<thead>
			<tr>
				<th>번호</th>
				<th>작성일</th>
				<th>제목</th>			
			</tr>		
		</thead>

		<tbody>
			<% if(articleListMap.size() == 0) { %>
				<tr><td colspan="3">등록된 게시물이 없습니다.</td></tr>
			<% } else { %>
			<%for (Map<String, Object> articleMap : articleListMap) { %>
			<tr>
				<td><%= (int) articleMap.get("id") %></td>
				<td><%= (LocalDateTime) articleMap.get("regDate") %></td>
				<td><a href="../article/detail?id=<%= (int) articleMap.get("id") %>"><%= (String) articleMap.get("title") %></a></td>
			</tr>
			<% } } %>
		</tbody>
	</table>
	
	<div>
		<a href="../home/main">메인페이지</a>
	</div>
	
	<style type="text/css">
		.paging > .red {
			color: red;
			font-size: 1.25rem;
		}
	</style>
	
	<div class="paging">
		<% for(int i = 1; i <= totalPageCnt; i++) { %>
			<a class="<%= curPage == i ? "red" : "" %>" href="?page=<%= i %>"><%= i %></a>
		<% } %>
	</div>
	
</body>
</html>