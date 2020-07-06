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

	String title = request.getParameter("title");

	String writer = request.getParameter("writer");
	
	String description = request.getParameter("description");
	
	String num_check = request.getParameter("num_check");
	
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/bizmooc");
	Connection conn = ds.getConnection();	
	PreparedStatement ps = null; 	
	
	try{			
		ps = conn.prepareStatement("UPDATE board SET title=?, description=?, num_check=? WHERE id=?");
		
		ps.setString(1, title);
		ps.setString(2, description);
		ps.setString(3, num_check);
		ps.setString(4, id);

	
		ps.executeUpdate();
	}catch(Exception e){
		out.print(e);
	
	}finally{
		ps.close(); conn.close(); ic.close();
		
		}	
		
	
	response.sendRedirect("board2.jsp"); 
		%>
</body>
</html>