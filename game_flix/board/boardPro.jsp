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
	
<% String sessionId = (String)session.getAttribute("sessionId");%>
	<% 
	
	request.setCharacterEncoding("utf-8");
	
	
	String title = request.getParameter("title");
	out.print(title);
	String writer = request.getParameter("writer");
	String description = request.getParameter("description");
	String num_check = request.getParameter("num_check");
	
	
	Connection conn =null;
	Statement stmt =null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	
	try{
		
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/bizmooc");
		Connection con = ds.getConnection();
		ps = con.prepareStatement("insert into board" + 
		"(title,description,num_check,writer)" + "values(?,?,?,?)"); 

	
		
		ps.setString(1, title);
		ps.setString(2, description);
		ps.setString(3, num_check);
		ps.setString(4, sessionId);
		
		ps.executeUpdate();
		
		
	}catch(Exception e){
		out.print(e);
	}

	
	
	response.sendRedirect("board2.jsp");
	%>
</body>
</html>