<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 스크립틀릿 -->
<%
	String inputDan = request.getParameter("dan");	// 요청받은 파라미터를 가져올 수 있음
	String inputColor = request.getParameter("color");
	String inputLimit = request.getParameter("limit");
	
	if (inputDan == null || inputDan.equals("")) {
		inputDan = "1";
	}
	if (inputLimit == null || inputLimit.equals("")) {
		inputLimit = "1";
	}
	if (inputColor == null || inputColor.equals("")) {
		inputColor = "black";
	}
	
	int dan = Integer.parseInt(inputDan);
	int limit = Integer.parseInt(inputLimit);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>

<body>
	<h1 style="color: <%= inputColor %>">== <%= dan %>단 ==</h1>
	
	<% for (int i = 1; i <= limit; i++){ %>
		<div style="color: <%= inputColor %>"><%= dan %> x <%= i %> = <%= dan * i %></div>
	<% } %>
</body>
</html>