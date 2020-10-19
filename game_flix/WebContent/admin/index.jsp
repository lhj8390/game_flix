<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login">
				<form class="login100-form validate-form" action="member/loginResult.jsp" method="post">
					<span class="login100-form-title">
						GAMEFLIX ADMIN
					</span>

					<div class="wrap-input100 validate-input" data-validate = "아이디 미입력">
						<input class="input100" type="text" name="id" placeholder="Id">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="비밀번호 미입력">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">
							Sign in
						</button>
					</div>

					<div class="text-center">
						
						<span class="txt1">
							아이디/비밀번호를 모를 경우 관리자에게 문의하세요
						</span>

						
					</div>

				</form>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

	<script type="text/javascript" src="js/index.js"></script>
</body>
</html>