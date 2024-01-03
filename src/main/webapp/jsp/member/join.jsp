<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function joinSubmit(){		
		const loginId = document.querySelector("#loginId").value.trim();
		const loginPw = document.querySelector("#loginPw").value.trim();
		const loginPwChk = document.querySelector("#loginPwChk").value.trim();
		const name = document.querySelector("#name").value.trim();
		
		// 공백 검사
		if (loginId == "" || loginPw == "" || loginPwChk == "" || name == "") {
			alert("빈칸을 채워주세요.");
			return false;
		}
		
		// 비밀번호 검사
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
			<input id="loginId" name="loginId" type="text" placeholder="LoginId" />
		</div>
		
		<div>
			<input id="loginPw" name="loginPw" type="password" placeholder="Password" />
		</div>
		
		<div>
			<input id="loginPwChk" type="password" placeholder="Confirm Password" />
		</div>
		
		<div>
			<input id="name" name="name" type="text" placeholder="Username" />
		</div>
		
		<div>
			<button>가입</button>
			<a href="../home/main">취소</a>
		</div>
	</form>
</body>
</html>