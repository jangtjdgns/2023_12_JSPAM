<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function joinSubmit(){
		let loginPw = document.querySelector("#loginPw").value;
		let loginPwChk = document.querySelector("#loginPwChk").value;
		
		if(loginPw != loginPwChk) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	}
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="doJoin" method="post" onsubmit="return joinSubmit();">
		<div>
			<input name="loginId" type="text" placeholder="LoginId" />
		</div>
		
		<div>
			<input id="loginPw" name="loginPw" type="password" placeholder="Password" />
		</div>
		
		<div>
			<input id="loginPwChk" type="password" placeholder="Confirm Password" />
		</div>
		
		<div>
			<input name="name" type="text" placeholder="Username" />
		</div>
		
		<div>
			<button>가입</button>
			<a href="../home/main">취소</a>
		</div>
	</form>
</body>
</html>