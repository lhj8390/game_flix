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
<jsp:useBean id="member" class="member.Members" />
<jsp:setProperty property="*" name="member" />
<meta charset="UTF-8">
<title>Account PRO</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("sessionId");

	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	Connection conn = ds.getConnection();

	member.setUserId(request.getParameter("id"));
	member.setUserPwd(request.getParameter("pwd"));
	member.setUserName(request.getParameter("name"));
	member.setPhoneNo(request.getParameter("tel"));
	member.setAddress(request.getParameter("add"));
	member.setEmail(request.getParameter("email"));	
	member.setCategory(request.getParameter("category"));	

	String sql ="update MEMBERS set userpwd =?, username =?, phoneno =?, address =?, email=?, category=? where userid = '";
	PreparedStatement pstmt = conn.prepareStatement(sql + id + "'");
	pstmt.setString(1, member.getUserPwd());
	pstmt.setString(2, member.getUserName());
	pstmt.setString(3, member.getPhoneNo());
	pstmt.setString(4, member.getAddress());
	pstmt.setString(5, member.getEmail());
	pstmt.setString(6, member.getCategory());
	pstmt.executeUpdate();	
	
	pstmt.close(); conn.close(); ic.close();
	
	response.sendRedirect("member_account.jsp");
%>
</body>
</html>