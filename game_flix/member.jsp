<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.5.1.js"></script>
<script src="js/idCheck.js"></script>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/member.css">
<title>Member</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div style="height: 80px"></div>	
	<div id="div_center_x">
	<form action="memberPro.jsp" method="post" name="join">
	<fieldset>
       <legend style="color: gray; font-size: 1.2em; font-weight: bold; margin-bottom:10px;">회원가입</legend>	
		<table class="member_table" >			
			<tr>
				<td>아이디</td>
				<td><input style="height: 40px; width: 150px;" type="text" name="id"/>
					<input style="height: 40px; width: 100px;" name="confirm_id" type="button" value="중복확인" onclick="idCheck(this.form)"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input style="height: 40px; width: 250px;" type="password" name="pwd"/></td>
			</tr>
			<tr>
				<td>이&nbsp;&nbsp;름</td>
				<td><input style="height: 40px; width: 250px;" type="text" name="name"/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input style="height: 40px; width: 250px;" type="tel" name="tel"/></td>
			</tr>
			<tr>
				<td>이 메 일</td>
				<td><input style="height: 40px; width: 250px;" type="email" name="email"/></td>
			</tr>
			<tr>
				<td>주&nbsp;&nbsp;소</td>
				<td><input style="height: 40px; width: 250px;" type="text" name="add"/></td>
			</tr>
			<tr>
				<td>선호장르</td>
				
				<td>
				<input id="first" type="radio" name="category" value="전략" checked>전략&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="second" type="radio" name="category" value="인디">인디&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="third" type="radio" name="category" value="액션">액션&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="first"></label>
                <label for="second"></label>
                <label for="third"></label></td>
			</tr>
			<tr>				
				<th colspan="2">
				<button class="btn" type="submit">가입하기</button>
				<button class="btn" type="reset">취소하기</button></th>
			</tr>		
		</table>
		</fieldset>	
	</form>		
	</div>
	<div style="height: 80px"></div>
<jsp:include page="footer.jsp"/>
</body>
</html>