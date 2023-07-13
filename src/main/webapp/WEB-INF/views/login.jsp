<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<title>로그인 화면</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		
		<!-- 쿠키 - 저장공간 -->
		<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script> 
		<link rel="stylesheet" href="./css/login.css">
	</head>
	<body>
		<div class="login-wrapper">
			<h2>Login</h2>
			<form action="loginAf.do" method="post" id="loginForm"> <!-- 로그인후 jsp로 안보이게 보낼것 -->
				<input type="text" id="id" name="id" size="20" placeholder="아이디를 입력하세요.">
				<input type="password" name="pwd" placeholder="password" size="20">
				ID 저장 <input type="checkbox" id="chk_save_id" >
				<input type="submit" value="login">
				<a href="regi.do">Sign Up Here!</a>
			</form>
		</div>
		
		<script type="text/javascript">
			/* 
				sessoin : server에 저장. login 정보를 저장 (Object를 저장)
				cookie	: client에 저장. id, pw저장 (String만 저장 가능)
			*/
			
			let user_id = $.cookie("user_id"); // 쿠기에 id 저장되어있으면 가져옴
			
			if(user_id != null){ // null이 아니다 == 저장한 아이디가 있음
				$("#id").val(user_id); // id 자동으로 채워짐
				$("#chk_save_id").prop("checked", true); // 체크 박스에 체크 
			}
			
			$("#chk_save_id").click(function(){ // 체크박스 클릭
				// 확인용
				// alert("click");
				// alert($("#chk_save_id").is(":checked"));
				
				if ( $("#chk_save_id").is(":checked") == true){ // id를 저장하겠다 --> cookie에 
					
					if($("#id").val().trim() == ""){ // 빈 문자열인 경우 저장 x
						alert("공백은 저장할 수 없습니다. ID를 입력해주세요.");
						$("#chk_save_id").prop("checked", false); // 
					} 
				
					else{ // 빈 문자아니면 cookie에 저장
						$.cookie("user_id", $("#id").val().trim(), { expires:7, path: './'}); // 7일간 어느경로든으로 설정, "user_id"로 저장
					}
				}
				
				else{ // cookie에 저장하지 않음(삭제)
					$.removeCookie("user_id", {path:'./'}); // 기간 설정 x --> "user_id"라는 쿠키를 삭제
				}
	
			});
		</script>
		
	</body>
</html>