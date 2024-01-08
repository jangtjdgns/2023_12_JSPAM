<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	int curPage = (int) request.getAttribute("page");
	int totalPageCnt = (int) request.getAttribute("totalPageCnt");
	int itemsInAPage = (int) request.getAttribute("itemsInAPage");
	String searchKeyword = (String) request.getAttribute("searchKeyword");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물목록</title>
</head>

<body>
	<h1>게시물 목록</h1>
	
	<%@ include file="../common/topBar.jsp" %>
	
	<div>
		<a href="write">글쓰기</a>
	</div>
	<table border="1">
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
				<th>작성자</th>
			</tr>		
		</thead>

		<tbody>
			<% if(articleListMap.size() == 0) { %>
				<tr><td colspan="4">등록된 게시물이 없습니다.</td></tr>
			<% } else { %>
			<%for (Map<String, Object> articleMap : articleListMap) { %>
			<tr>
				<td><%= (int) articleMap.get("id") %></td>
				<td><%= (LocalDateTime) articleMap.get("regDate") %></td>
				<td><a href="../article/detail?id=<%= (int) articleMap.get("id") %>"><%= (String) articleMap.get("title") %></a></td>
				<td><%= (String) articleMap.get("writerName") %></td>
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
		<%
		int from = ((curPage - 1) / itemsInAPage) * itemsInAPage + 1;
		
		if(from != 1) {
		%>
			<a href="?page=1&searchKeyword=<%= searchKeyword %>">&lt;&lt;</a>	
			<a href="?page=<%= from - 1 %>&searchKeyword=<%= searchKeyword %>">&lt;</a>
		<% }
		int end = ((curPage - 1) / itemsInAPage + 1) * itemsInAPage;
		end = end > totalPageCnt ? totalPageCnt : end; 

		for(int i = from; i <= end; i++) {
		%>
			<a class="<%= curPage == i ? "red" : "" %>" href="?page=<%= i %>&searchKeyword=<%= searchKeyword %>"><%= i %></a>
		<% }
		if(end != totalPageCnt){ 
		%>
			<a href="?page=<%= end + 1 %>&searchKeyword=<%= searchKeyword %>">&gt;</a>
			<a href="?page=<%= totalPageCnt %>&searchKeyword=<%= searchKeyword %>">&gt;&gt;</a>			
		<% }%>
	</div>
	
	<div>
		<form action="list" method="get">
			<input type="text" name="searchKeyword" placeholder="검색" value="<%= searchKeyword %>"/>
			<button>검색</button>
		</form>
	</div>
	
</body>
</html>