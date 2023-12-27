<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 형변환 
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물목록</title>
</head>

<body>
	<h1>게시물 목록</h1>
	<ul>
	<%for (Map<String, Object> articleMap : articleListMap) { %>
		<li><a href="../article/detail?id=<%= (int) articleMap.get("id") %>"><%= (int) articleMap.get("id") %> | <%= (LocalDateTime) articleMap.get("regDate") %> | <%= (String) articleMap.get("title") %></a></li>
	<% } %>
	</ul>
	<div>
		<a href="../home/main">메인페이지</a>
	</div>
</body>
</html>