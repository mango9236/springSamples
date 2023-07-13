<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<link rel="stylesheet" href="./css/regi.css">
	</head>
	<body>  
		<div class="register-wrapper">
			<h2>Register</h2>
			<form action="regiAf.do" method="post" id="registerForm">
				<input type="text" name="id" id="id" size="5" placeholder="아이디"> 
				<input type="button" id="id_chk_btn" value="ID 중복 확인" size="10"><br> <!-- 아이디 중복체크  -->
				<p id="idcheck"></p>
				<input type="password" name="pwd" id="pwd" size="20" placeholder="비밀번호">
				<p id="pwdcheck"></p>
				<input type="text" name="name" size="20" placeholder="이름">
				<input type="email" name="email" size="20" placeholder="이메일">
				<input type="submit" id="submitBtn" value="회원가입">
			</form>
		</div>
	</body>
	
	<script type="text/javascript">
		/* 아이디 중복 확인 */
		$(document).ready(function(){
			
			$("#id_chk_btn").click(function(){ // 중복 아이디 버튼 클릭시 ajax로 현재 페이지에서 체크
				// ID 규칙 포함: 대소문자 + 특수문자 
				// ID 글자의 갯수 
				
				// ID 사용할 수 있는지 없는지 체크 (AJAX)
				$.ajax({
					url:"idcheck.do", 
					type:"post",
					data:{ "id": $("#id").val() }, // input에 id라는 이름의 value값을 보내준다.
					
					success : function(answer){ 
						// alert(answer); JSON("str":"~")으로 넘어오는것을 확인할 수 있음
						
						if (answer == "YES"){ // JSON k-v 쌍으로 넘어옴
							$("#idcheck").css("color", "#0000ff"); // 사용 가능한 아이디면 파란색
							$("#idcheck").text("사용가능한 아이디입니다.");
						}
						
						else{
							$("#idcheck").css("color", "#ff0000"); // 사용 불가능한 아이디면 빨간색
							$("#idcheck").text("이미 사용중인 아이디입니다.");
							$("#id").val(""); // 빈칸으로 비워주기
						} 
						
					},
					
					error : function(){
						alert("error");
					}
				});
			});
		});
	</script>
	
	<script type="text/javascript">
		/* 비밀번호 검사 확인 */
		$(document).ready(function(){
			$('#pwd').on('input', function() {
				let pwd = $(this).val();
				let len = pwd.length;
				
				// 8~16자리 + 숫자/영문 포함 : 정규표현식으로 숫자, 영어 포함여부 테스트
				if (len >= 8 && len <= 16 && /[a-zA-Z]/.test(pwd) && /[0-9]/.test(pwd)){ 
					$("#pwdcheck").css("color", "#0000ff"); // 사용 가능한 비밀번호면 파란색
					$("#pwdcheck").text("사용가능한 비밀번호입니다.");
					$("#submitBtn").prop("disabled", false); // 폼 제출 가능
				}
				
				else{
					$("#pwdcheck").css("color", "#ff0000"); // 사용 불가능한 비밀번호면 빨간색
					$("#pwdcheck").text("비밀번호는 8~16자리 영문/숫자를 포함해야합니다.");
					$("#submitBtn").prop("disabled", true); // 폼 제출 못하도록 막기
				}
			});
		});
	</script>
</html>