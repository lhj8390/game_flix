<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//1. 로그인 페이지에서 파라미터 정보 (ID와 PW정보 취득)
	String id = (String) request.getParameter("id");
	

	//2. SQL 연동 후 MEMBERS 정보 취득 후 일치여부 확인
	//2. SQL 연동 후 MEMBERS 정보 취득 후 일치여부 확인
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM MEMBERS WHERE USERID='" + id + "'");	
	ResultSet rs = pstmt.executeQuery();	
	if (rs.next()) {
		if (id.equals(rs.getString(1))) {
			rs.close();						
			out.println("<script> alert(\"사용할 수 없는 아이디 입니다.\"); history.back();</script>");
		} 
	} else {
		rs.close();
		out.println("<script> alert(\"사용할 수 있는 아이디 입니다.\"); history.back();</script>");
	}
	rs.close();	pstmt.close();	conn.close();	
	%>

</body>
</html>