<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	
	request.setCharacterEncoding("utf-8");
	
	
	String id = request.getParameter("id");

	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/bizmooc");
	Connection conn = ds.getConnection();	
	PreparedStatement ps = null; 	
	
				
		ps = conn.prepareStatement("delete from board where id=?");
		
	
		ps.setString(1, id);

	
		ps.executeUpdate();
		
		
	
		ps.close(); conn.close(); ic.close();
		
		
		response.sendRedirect("board2.jsp"); 
	

		%>
</body>
</html>