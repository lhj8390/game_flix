<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="org.fullstack.beans.Members" />
<jsp:setProperty property="*" name="member" />
<meta charset="UTF-8">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<title>Member Join</title>
<style>
body {
 background : black;
}
fieldset{
    width: 920px;
    display: block;
    margin: 0 auto;
}
fieldset table{
	border : 1px solid gray;
    width: 900px;    
    padding-top: 10px;
    margin-left: auto;
    margin-right: auto;       
}
fieldset table tr{
    text-align: center;  
}
fieldset table tr td a{
    text-decoration: none;
    color: gray;
    font-size: 12px;
}
fieldset table tr td a:hover{
    text-decoration: underline;
}
p{
    padding-top: 30px;
    text-align: center;
    color: blanchedalmond;
    font-size: 30px;
    font-weight: bold;
}
fieldset{
    margin: 0 auto;   
    border-radius: 10px;
    color: white;  
 }
input {
	width : 150px;	
}
</style>
</head>
<body>
	<%
	String id = (String)session.getAttribute("sessionId");
	
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM MEMBERS WHERE USERID='" + id + "'");	
	ResultSet rs = pstmt.executeQuery();	

	while (rs.next()) {
		member.setUserId(rs.getString(1));
		member.setUserPwd(rs.getString(2));		
		member.setUserName(rs.getString(3));
		member.setPhoneNo(rs.getString(4));
		member.setAddress(rs.getString(5));
		member.setEmail(rs.getString(6));
		member.setCategory(rs.getString(7));
%>	
	<jsp:include page="header.jsp"/>
	<div></div>
	<div id="div_center_x">
		<fieldset>
			<legend>회 원 정 보</legend>
			<form action="accountPro.jsp" method="POST">
				<table border="1">				
					<tr>
						<th rowspan="5">케릭터</th>
						<td>아이디</td>
						<td><input type="text" name="id" size="140" value="<%=member.getUserId()%>" readonly></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd"  size="80" value="<%=member.getUserPwd()%>"></td>
					</tr>
					<tr>
						<td>이름</td>	<td><input type="text" name="name" value="<%=member.getUserName()%>"></td>
					</tr>
					<tr>
						<td>전화번호</td><td><input type="tel" name="tel" value="<%=member.getPhoneNo()%>"></td>
					</tr>
					<tr>
						<td>이메일</td><td><input type="email" name="email" value="<%=member.getEmail()%>"></td>
					</tr>
					<tr>
						<th rowspan="3"><button>파일업로드</button></th>
						<td>주소</td>	<td><input type="text" name="add" value="<%=member.getAddress()%>"></td>						
					</tr>
					<tr>
						<td rowspan="2">선호장르</td><td><input type="text" name="add" value="<%=member.getCategory()%>"></td>						
					</tr>
					<tr>
						<td><input width="30px" type="radio" name="category" value="전략">전략
						<input width="30px" type="radio" name="category" value="인디">인디
						<input width="30px" type="radio" name="category" value="액션">액션 	</td>
					</tr>					
					<tr>						
						<th colspan="3"><button>수정하기</button> <button>회원탈퇴</button></th>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
	<div>
	</div>
	<div>
	<fieldset>
			<legend>선 호 정 보</legend>	
			<table>
				<th><img width ="360px" alt="" src="images/Battlegrond_img.jpg"> </th>
				<th><img width ="360px" alt="" src="images/Civilization_img.jpg"></th>
				<th><img width ="360px" alt="" src="images/Daybyday_Img.jpg"> </th>
				<th><img width ="360px" alt="" src="images/Desperado3_Img.jpg"></th>
			</table>		
	</fieldset>
	</div>
<jsp:include page="footer.jsp"/>
<%}
	rs.close(); pstmt.close(); conn.close(); ic.close();
		%>
</body>
</html>