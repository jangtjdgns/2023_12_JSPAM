<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Map<String, Object> articleMap = (Map<String, Object>) request.getAttribute("articleMap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>

</head>
<body>
	<h1><%= articleMap.get("id") %>번 게시물 수정</h1>
	<form action="doModify" method="post">
		<!-- hidden 타입의 input은 보통 form 태그 아래에 둔다고함 (필수가 아니라 관례 정도) -->
		<input name="id" type="hidden" value="<%= articleMap.get("id") %>"/>
		
		<table border="1">
			<colgroup>
				<col />
				<col width="200"/>
			</colgroup>
			<tr>
				<th>번호</th>
				<td><%= articleMap.get("id") %></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%= articleMap.get("regDate") %></td>
			</tr>
			<% if(!articleMap.get("regDate").equals(articleMap.get("updateDate"))) { %>
			<tr>
				<th>수정일</th>
				<td><%= articleMap.get("updateDate") %></td>
			</tr>
			<% } %>
			<tr>
				<th>제목</th>
				<td><input name="title" type="text" value="<%= articleMap.get("title") %>"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="body"><%= articleMap.get("body") %></textarea></td>
			</tr>
		</table>
		<div>
			<button>저장</button>
			<button type="button" onclick="history.back()">취소</button>
			<!-- 또는 <a href="detail?id=<%= articleMap.get("id") %>"></a> -->
			<a href="list">목록</a>
		</div>
	</form>
</body>
</html>