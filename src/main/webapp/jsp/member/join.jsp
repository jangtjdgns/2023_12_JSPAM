<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<body>
	<h1>회원가입</h1>
	
	<script>
		const joinFormSubmit = function(form){
			// 재할당
			form.loginId.value = form.loginId.value.trim();
			form.loginPw.value = form.loginPw.value.trim();
			form.loginPwChk.value = form.loginPwChk.value.trim();
			form.name.value = form.name.value.trim();
			
			// 공백 검사
			if (form.loginId.value.length == 0) {
				alert('아이디를 입력해주세요');
				form.loginId.focus();
				return;
			}
			
			if (form.loginPw.value.length == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginId.focus();
				return;
			}
			
			// 비밀번호 확인 검사
			if (form.loginPwChk.value.length == 0) {
				alert('비밀번호 확인을 입력해주세요');
				form.loginId.focus();
				return;
			}
			
			if (form.loginPw.value != form.loginPwChk.value) {
				alert('비밀번호를 확인해주세요');
				form.loginPw.value = '';
				form.loginPwChk.value = '';
				form.loginPw.focus();
				return;
			}
			
			if (form.name.value.length == 0) {
				alert('이름을 입력해주세요');
				form.loginId.focus();
				return;
			}
			
			form.submit();
		}
	</script>
	
	<form action="doJoin" method="post" onsubmit="joinFormSubmit(this); return false;">
		<div>
			<!-- autocomplete="off" 자동완성기능, 자동완성기능을 키고 끌수 있음 -->
			<input type="text" name="loginId" placeholder="LoginId" />
		</div>
		
		<div>
			<input type="password" name="loginPw" placeholder="Password" />
		</div>
		
		<div>
			<input type="password" name="loginPwChk" placeholder="Confirm Password" />
		</div>
		
		<div>
			<input type="text" name="name" placeholder="Username" />
		</div>
		<button>가입</button>
	</form>
	
	<div>
		<a href="../home/main">메인페이지</a>
	</div>
</body>
</html>