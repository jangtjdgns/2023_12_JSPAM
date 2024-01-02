<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="doJoin">
		<div>
			아이디: <input name="loginId" type="text" />
		</div>
		
		<div>
			비밀번호: <input name="loginPw" type="password" />
		</div>
		
		<div>
			비밀번호 확인: <input type="password" />
		</div>
		
		<div>
			이름: <input name="name" type="text" />
		</div>
		
		<div>
			<button>가입</button>
			<a href="../home/main">취소</a>
		</div>
	</form>
</body>
</html>