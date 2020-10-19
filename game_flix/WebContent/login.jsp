<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/login.css">
<title>LogIn | Home</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div id="wrapper">
		<section id="mainPage">
			<div></div>
			<div id="div_center">
				<%
					if (session.isNew() || session.getAttribute("id") == null) {
					String msg = (String) request.getAttribute("error");
				%>
				<form action="login_action.jsp" method="post" name="frm">
					<input id="input_op" type="text" name="id" placeholder="아 이 디" required>
					<input id="input_op" type="password" name="pw" placeholder="패스워드" required>
					<br /> 
					<input id="input_op" type="button" value="LOGIN" class="login">
				</form>
				<%
					}
				%>
			</div>
			<div></div>
		</section>	
	</div>
	<div class="elementToFadeInOut"></div>
<jsp:include page="footer.jsp"/>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('.login').click(function() {
			$("div.elementToFadeInOut").fadeIn(2000);
            
			setInterval(function(){
				document.frm.submit();
			},2000);
			
		});
	});
</script>
</html>