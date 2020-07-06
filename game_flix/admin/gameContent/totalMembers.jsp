<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Total Members</title>
<link rel="stylesheet" type="text/css" href="../css/gameContent.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div class="limiter">
		<div class="container">
			<div class="wrap">
				<div class="table">
					<table>
						<thead>
							<tr class="table_head">
								<th class="column3">아 이 디</th>
								<th class="column3">패스워드</th>
								<th class="column3">성 명</th>
								<th class="column3">전화번호</th>
								<th class="column3">E-mail</th>	
								<th class="column3">주 소 </th>								
								<th class="column3">선호장르</th>
							</tr>
						</thead>
<%
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
Connection conn = ds.getConnection();
PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM MEMBERS");	
ResultSet rs = pstmt.executeQuery();	
while(rs.next()){
%>	
						<tbody>	
							<tr class="myrow">		
								<td class="column3"><%=rs.getString(1) %></td>
								<td class="column3"><%=rs.getString(2) %></td>
								<td class="column3"><%=rs.getString(3) %></td>
								<td class="column3"><%=rs.getString(4) %></td>
								<td class="column3"><%=rs.getString(5) %></td>
								<td class="column3"><%=rs.getString(6) %></td>
								<td class="column3"><%=rs.getString(7) %></td>
							</tr>
						</tbody>
								
<% } rs.close(); pstmt.close(); conn.close(); ic.close(); %>
					</table>
				</div>
			</div>
		</div>
	</div>							
</body>
</html>