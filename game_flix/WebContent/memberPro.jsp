<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="member.Members" />
<jsp:setProperty property="*" name="member" />
<meta charset="UTF-8">
<title>JOIN PRO</title>
</head>
<body>
	<%
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("INSERT INTO MEMBERS VALUES(?, ?, ?, ?, ?, ?, ?)");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String add = request.getParameter("add");
	String em = request.getParameter("email");
	String ca = request.getParameter("category");

	member.setUserId(id);
	member.setUserPwd(pwd);
	member.setUserName(name);
	member.setPhoneNo(tel);
	member.setAddress(add);
	member.setEmail(em);
	member.setCategory(ca);

	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	pstmt.setString(3, name);
	pstmt.setString(4, tel);
	pstmt.setString(5, add);
	pstmt.setString(6, em);
	pstmt.setString(7, ca);
	pstmt.executeUpdate();

	pstmt.close(); conn.close(); ic.close();
	
	response.sendRedirect("login.jsp");
	%>
	
</body>
</html>